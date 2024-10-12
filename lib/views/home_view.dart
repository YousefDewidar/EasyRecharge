// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recharge_balance/cubits/lang_cubit.dart';
import 'package:recharge_balance/generated/l10n.dart';
import 'package:recharge_balance/widgets/mobile_type.dart';
import 'package:recharge_balance/widgets/recharge_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
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
          icon: const Icon(Icons.language, color: Colors.white),
        ),
        title: Text(S.of(context).title),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 35, 56, 50),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MobileType(
                color: Colors.red,
                name: S.of(context).vodafone,
                type: "فودافون",
              ),
              const SizedBox(width: 8),
              MobileType(
                color: Colors.green,
                name: S.of(context).etisalat,
                type: "اتصالات",
              ),
              const SizedBox(width: 8),
              MobileType(
                color: Colors.orange,
                name: S.of(context).orange,
                type: "اورانج",
              ),
              const SizedBox(width: 8),
              MobileType(
                color: Colors.deepPurple,
                name: S.of(context).we,
                type: "وي",
              ),
            ],
          ),
          const SizedBox(height: 30),
          const RechargeButton(),
        ],
      ),
    );
  }
}
