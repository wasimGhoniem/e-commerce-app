import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repositories/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../entities/user_data_response_entity.dart';

@injectable
class GetUserDataUseCase {
  ProfileRepository profileRepository;

  GetUserDataUseCase({required this.profileRepository});

  Future<Either<Failures, UserDataResponseEntity>> invoke() {
    return profileRepository.getUserData();
  }
}
