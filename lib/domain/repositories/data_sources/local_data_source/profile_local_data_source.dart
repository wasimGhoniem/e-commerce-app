import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/user_data_response_entity.dart';

abstract class ProfileLocalDataSource {
  Future<Either<Failures, UserDataResponseEntity>> getUserData();
}
