import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/domain/entities/UpdateLoggedUserResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/user_data_response_entity.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/local_data_source/profile_local_data_source.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/remote_data_source/update_logged_user_remote_data_source.dart';
import 'package:e_commerce_app/domain/repositories/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImp implements ProfileRepository {
  ProfileLocalDataSource profileLocalDataSource;
  UpdateLoggedUserRemoteDataSource updateLoggedUserRemoteDataSource;

  ProfileRepositoryImp(
      {required this.profileLocalDataSource,
      required this.updateLoggedUserRemoteDataSource});

  @override
  Future<Either<Failures, UserDataResponseEntity>> getUserData() {
    return profileLocalDataSource.getUserData();
  }

  @override
  Future<Either<Failures, UpdateLoggedUserResponseEntity>> updateLoggedUserData(
      String name, String email, String phone) {
    return updateLoggedUserRemoteDataSource.updateLoggedUserData(
        name, email, phone);
  }
}
