import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/UpdateLoggedUserResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';

@injectable
class UpdateLoggedUserUseCase {
  ProfileRepository profileRepository;

  UpdateLoggedUserUseCase({required this.profileRepository});

  Future<Either<Failures, UpdateLoggedUserResponseEntity>> invoke(
      String name, String email, String phone) {
    return profileRepository.updateLoggedUserData(name, email, phone);
  }
}
