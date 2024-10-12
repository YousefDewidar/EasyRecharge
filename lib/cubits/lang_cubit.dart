import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recharge_balance/cubits/lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super((LangInit()));

  void setLang(String lang) {
    emit(Lang(lang));
  }
}
