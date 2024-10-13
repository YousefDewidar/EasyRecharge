// ignore_for_file: use_build_context_synchronously

import 'package:easy_recharge/cubits/lang_cubit.dart';
import 'package:easy_recharge/generated/l10n.dart';
import 'package:easy_recharge/views/widgets/mobile_type.dart';
import 'package:easy_recharge/views/widgets/recharge_button.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).services,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(208, 255, 255, 255)),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MobileType(
                  color: const Color.fromARGB(255, 244, 119, 37),
                  name: S.of(context).vodafone,
                  type: "فودافون",
                  image: 'assets/pngegg.png',
                ),
                const SizedBox(width: 8),
                MobileType(
                  color: Colors.green,
                  name: S.of(context).etisalat,
                  type: "اتصالات",
                  image: 'assets/eti.png',
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MobileType(
                  color: Colors.orange,
                  name: S.of(context).orange,
                  type: "اورانج",
                  image: 'assets/orange-logo-116093713624dxieyabws.png',
                ),
                const SizedBox(width: 8),
                MobileType(
                  color: Colors.deepPurple,
                  name: S.of(context).we,
                  type: "وي",
                  image: 'assets/المصرية للاتصالات.png',
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: RechargeButton(),
            ),
          ],
        ),
      ),
    );
  }
}
