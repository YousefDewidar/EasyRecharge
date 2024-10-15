// ignore_for_file: use_build_context_synchronously
import 'package:easy_recharge/cubits/lang_cubit.dart';
import 'package:easy_recharge/generated/l10n.dart';
import 'package:easy_recharge/views/widgets/recharge_button.dart';
import 'package:easy_recharge/views/widgets/types_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xffeef5db),
        elevation: 100,
        leading: IconButton(
          onPressed: () async {
            var pref = await SharedPreferences.getInstance();
            if (pref.containsKey('lang')) {
              if (pref.getString('lang') == 'ar') {
                pref.setString('lang', 'en');
                BlocProvider.of<LangCubit>(context).setLang('en');
              } else {
                pref.setString('lang', 'ar');
                BlocProvider.of<LangCubit>(context).setLang('ar');
              }
            } else {
              pref.setString('lang', 'en');
              BlocProvider.of<LangCubit>(context).setLang('en');
            }
          },
          icon: const Icon(Icons.language, color: Colors.black),
        ),
        title: Text(
          S.of(context).title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xff333745),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/stars1.png'), fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            Text(
              S.of(context).services,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(208, 255, 255, 255)),
            ),
            const SizedBox(height: 25),
            TypesGridView(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  Expanded(child: RechargeButton(camOrgal: 1)),
                  SizedBox(width: 5),
                  Expanded(flex: 4, child: RechargeButton(camOrgal: 0)),
                ],
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
