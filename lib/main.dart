import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:recharge_balance/cubits/home_cubit.dart';
import 'package:recharge_balance/cubits/lang_cubit.dart';
import 'package:recharge_balance/cubits/lang_state.dart';
import 'package:recharge_balance/views/home_view.dart';
import 'generated/l10n.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => LangCubit(),
    child: const RechargeBalance(),
  ));
}

class RechargeBalance extends StatelessWidget {
  const RechargeBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangCubit, LangState>(
      builder: (context, state) {
        return MaterialApp(
          locale: state is Lang ? Locale(state.lang) : const Locale('ar'),
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
