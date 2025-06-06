import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';

import '../../../core/error/failures.dart';

abstract class AuthRepository {
  /*{
    "name": "Ahmed Abd Al-Muti",
    "email":"ahmedmuttii4012@gmail.com",
    "password":"Ahmed@123",
    "rePassword":"Ahmed@123",
    "phone":"01010700701"
}*/

  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}