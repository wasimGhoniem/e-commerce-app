import 'package:e_commerce_app/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/cache/shared_preference_utils.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;
  var formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'ahmed mohamed');
  final mobileController = TextEditingController(text: '01030350689');
  final emailController = TextEditingController(text: 'ahmedWasem3@gmail.com');
  final passwordController = TextEditingController(text: 'pass1234');
  final rePasswordController = TextEditingController(text: 'pass1234');
  final addressController = TextEditingController(text: 'giza october');
  bool obscureTextPassword = true;
  bool obscureTextRePassword = true;

  @override
  Future<void> close() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    addressController.dispose();
    return super.close();
  }

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  void register() async {
    if (formKey.currentState!.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          rePasswordController.text,
          mobileController.text);

      either.fold((error) {
        emit(RegisterErrorState(failures: error));
      }, (response) async {
        await saveUserData();
        emit(RegisterSuccessState(registerResponseEntity: response));
      });
    }
  }

  Future<void> saveUserData() async {
    await SharedPreferenceUtils.saveData(
        key: 'user_name', value: nameController.text);

    await SharedPreferenceUtils.saveData(
        key: 'user_email', value: emailController.text);

    await SharedPreferenceUtils.saveData(
        key: 'user_mobile', value: mobileController.text);

    await SharedPreferenceUtils.saveData(
        key: 'user_address', value: addressController.text);

    await SharedPreferenceUtils.saveData(
        key: 'user_password', value: passwordController.text);
  }

  static RegisterViewModel get(context) => BlocProvider.of(context);

  void onPassClick() {
    obscureTextPassword = !obscureTextPassword;
    emit(RegisterPassClicked(obscureTextPassword: obscureTextPassword));
  }

  void onRePassClick() {
    obscureTextRePassword = !obscureTextRePassword;

    emit(RegisterRePassClicked(obscureTextRePassword: obscureTextRePassword));
  }
}
