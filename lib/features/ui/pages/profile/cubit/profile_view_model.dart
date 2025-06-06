import 'package:e_commerce_app/dependency_injection/di.dart';
import 'package:e_commerce_app/domain/entities/user_data_response_entity.dart';
import 'package:e_commerce_app/domain/use_cases/get_user_data_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/update_logged_user_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/profile/cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/cache/shared_preference_utils.dart';
import '../../../../../domain/entities/UpdateLoggedUserResponseEntity.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> {
  final GetUserDataUseCase getUserDataUseCase;
  UpdateLoggedUserUseCase updateLoggedUserUseCase;

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  ProfileViewModel(
      {required this.getUserDataUseCase, required this.updateLoggedUserUseCase})
      : super(ProfileInitialState());

  Future<void> getUserData() async {
    emit(ProfileLoadingState());
    var either = await getUserDataUseCase.invoke();
    either.fold(
      (failures) => emit(ProfileErrorState(failures: failures)),
      (userData) {
        _populateControllers(userData);
        emit(ProfileSuccessState(userData: userData));
      },
    );
  }

  void _populateControllers(UserDataResponseEntity userData) {
    fullNameController.text = userData.name;
    emailController.text = userData.email;
    passwordController.text = '********';
    mobileController.text = userData.mobile;
    addressController.text = userData.address;
  }

  Future<void> logout() async {
    await SharedPreferenceUtils.removeData('token');
    emit(ProfileLogOutState());
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileController.dispose();
    addressController.dispose();
    return super.close();
  }

  static ProfileViewModel get(context) => getIt<ProfileViewModel>();

  Future<void> saveUpdatedUserData(
      UpdateLoggedUserResponseEntity responseEntity) async {
    await SharedPreferenceUtils.saveData(
        key: 'user_name',
        value: responseEntity.user?.name ?? fullNameController.text);
    await SharedPreferenceUtils.saveData(
        key: 'user_email',
        value: responseEntity.user?.email ?? emailController.text);
  }

  updateLoggedUserData() async {
    if (formKey.currentState!.validate() == true) {
      emit(UpdateLoggedUserLoadingState());
      var either = await updateLoggedUserUseCase.invoke(
          fullNameController.text, emailController.text, mobileController.text);
      either.fold((error) {
        emit(UpdateLoggedUserErrorState(failures: error));
      }, (response) async {
        await saveUpdatedUserData(response);
        fullNameController.text =
            response.user?.name ?? fullNameController.text;
        emailController.text = response.user?.email ?? emailController.text;
        emit(UpdateLoggedUserSuccessState(
            updateLoggedUserResponseEntity: response));
      });
    }
  }
}
