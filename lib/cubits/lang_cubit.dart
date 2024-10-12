import 'package:easy_recharge/cubits/lang_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super((LangInit()));

  void setLang(String lang) {
    emit(Lang(lang));
  }
}
