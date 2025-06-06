import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';

import '../../../entities/CategoryResponseEntity.dart';
import '../../../entities/LoginResponseEntity.dart';
import '../../../entities/RegisterResponseEntity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
