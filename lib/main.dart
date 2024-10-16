import 'package:easy_recharge/cubits/home_cubit.dart';
import 'package:easy_recharge/cubits/lang_cubit.dart';
import 'package:easy_recharge/cubits/lang_state.dart';
import 'package:easy_recharge/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/l10n.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => LangCubit(),
    child: const EasyRecharge(),
  ));
}

class EasyRecharge extends StatefulWidget {
  const EasyRecharge({super.key});

  @override
  State<EasyRecharge> createState() => _EasyRechargeState();
}

class _EasyRechargeState extends State<EasyRecharge> {
  String? langg;

  @override
  void initState() {
    getLangFromLDB();
    super.initState();
  }

  void getLangFromLDB() async {
    var pref = await SharedPreferences.getInstance();
    langg = pref.getString('lang');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangCubit, LangState>(
      builder: (context, state) {
        return MaterialApp(
          locale: state is Lang ? Locale(state.lang) : Locale(langg ?? 'ar'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeView(),
          ),
        );
      },
    );
  }
}
