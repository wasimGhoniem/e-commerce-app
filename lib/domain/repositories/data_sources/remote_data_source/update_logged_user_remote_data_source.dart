import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/UpdateLoggedUserResponseEntity.dart';

abstract class UpdateLoggedUserRemoteDataSource {
  Future<Either<Failures, UpdateLoggedUserResponseEntity>> updateLoggedUserData(
      String name, String email, String phone);
}
