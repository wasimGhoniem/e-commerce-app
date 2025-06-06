import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';

abstract class RegisterStates {}
class RegisterInitialState extends RegisterStates {}
class RegisterLoadingState extends RegisterStates {}
class RegisterSuccessState extends RegisterStates {
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}

class RegisterErrorState extends RegisterStates {
  Failures failures;
  RegisterErrorState({required this.failures});
}
class RegisterPassClicked extends RegisterStates{
 bool  obscureTextPassword;
 RegisterPassClicked({required this.obscureTextPassword});

}
class RegisterRePassClicked extends RegisterStates{
  bool  obscureTextRePassword;
  RegisterRePassClicked({required this.obscureTextRePassword});

}