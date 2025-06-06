import 'package:e_commerce_app/core/services/navigation_service.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginViewModel({
    required this.loginUseCase,
    required this.navigationService,
  }) : super(LoginInitialState());

  final LoginUseCase loginUseCase;
  final NavigationService navigationService;
  var formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController(text: 'pass1234');
  bool obscureTextPassword = true;

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold(
        (error) => emit(LoginErrorState(failures: error)),
        (response) => emit(LoginSuccessState(loginResponseEntity: response)),
      );
    }
  }

  void onPassClick() {
    obscureTextPassword = !obscureTextPassword;
    emit(LoginPassClicked(obscureTextPassword: obscureTextPassword));
  }

  void navigateToRegister() {
    navigationService.navigateToReplacement(AppRoutes.registerRoute);
  }
}
