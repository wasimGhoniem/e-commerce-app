import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/domain/entities/UpdateLoggedUserResponseEntity.dart';

import '../../../../../domain/entities/user_data_response_entity.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  final UserDataResponseEntity userData;

  ProfileSuccessState({required this.userData});
}

class ProfileErrorState extends ProfileStates {
  final Failures failures;

  ProfileErrorState({required this.failures});
}

class ProfileLogOutState extends ProfileStates {}

// UpdateLoggedUser states
class UpdateLoggedUserLoadingState extends ProfileStates {}

class UpdateLoggedUserSuccessState extends ProfileStates {
  UpdateLoggedUserResponseEntity updateLoggedUserResponseEntity;

  UpdateLoggedUserSuccessState({required this.updateLoggedUserResponseEntity});
}

class UpdateLoggedUserErrorState extends ProfileStates {
  final Failures failures;

  UpdateLoggedUserErrorState({required this.failures});
}
