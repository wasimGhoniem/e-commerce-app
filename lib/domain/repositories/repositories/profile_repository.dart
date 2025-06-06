import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/UpdateLoggedUserResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/user_data_response_entity.dart';

import '../../../core/error/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failures, UserDataResponseEntity>> getUserData();

  Future<Either<Failures, UpdateLoggedUserResponseEntity>> updateLoggedUserData(
      String name, String email, String phone);
}
