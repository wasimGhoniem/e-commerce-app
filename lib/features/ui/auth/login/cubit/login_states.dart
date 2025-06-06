import 'package:e_commerce_app/domain/entities/LoginResponseEntity.dart';

import '../../../../../core/error/failures.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity loginResponseEntity;

  LoginSuccessState({required this.loginResponseEntity});
}

class LoginErrorState extends LoginStates {
  Failures failures;

  LoginErrorState({required this.failures});
}

class LoginPassClicked extends LoginStates {
  bool obscureTextPassword;

  LoginPassClicked({required this.obscureTextPassword});
}
