import 'package:e_commerce_app/l10n/localization/app_language_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLanguageProvider extends Cubit<AppLanguageStates>{
  String appLanguage = 'en';

  AppLanguageProvider() : super(AppLanguageInitialState());

  void changeAppLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    } else {
      emit(ChangeAppLanguage(newLanguage: newLanguage));
    }
  }
}