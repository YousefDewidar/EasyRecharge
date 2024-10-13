import 'dart:io';

import 'package:easy_recharge/cubits/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/l10n.dart';

class RechargeButton extends StatelessWidget {
  const RechargeButton({
    super.key,
  });

  Future<File?> pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  Future<String> getCardNum(InputImage inputImage, context) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    for (var text in recognizedText.blocks) {
      if (text.text.length == 16) {
        return text.text;
      }
    }

    textRecognizer.close();
    return S.of(context).try_again;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        backgroundColor: WidgetStatePropertyAll(Color.fromARGB(209, 238, 245, 219)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))))
      ),
      onPressed: () async {
        String? methodType = context.read<HomeCubit>().methodType;
        if (methodType != null) {
          var image = await pickImageFromCamera();
          if (image != null) {
            final InputImage inputImage = InputImage.fromFile(image);
            // ignore: use_build_context_synchronously
            String cardNum = await getCardNum(inputImage, context);
            switch (methodType) {
              case 'فودافون':
                launchUrl(Uri(
                  scheme: 'tel',
                  path: '*858*$cardNum#',
                ));
                break;
              case 'اتصالات':
                launchUrl(Uri(
                  scheme: 'tel',
                  path: '*556*$cardNum#',
                ));
                break;
              case 'اورانج':
                launchUrl(Uri(
                  scheme: 'tel',
                  path: '*102*$cardNum#',
                ));
                break;
              case 'وي':
                launchUrl(Uri(
                  scheme: 'tel',
                  path: '*322*$cardNum#',
                ));
                break;
            }
          }
        } else {
          SnackBar snackBar = SnackBar(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.all(40),
              content: Text(
                textAlign: TextAlign.center,
                S.of(context).choose,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Text(
        S.of(context).charge,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
