abstract class AppLanguageStates {}

class ChangeAppLanguage extends AppLanguageStates{

String newLanguage;
  ChangeAppLanguage({required this.newLanguage});
}
class AppLanguageInitialState extends AppLanguageStates{}