import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../repositories/repositories/home_repository.dart';

@injectable
class GetCartDataUseCase {
  HomeRepository homeRepository;

  GetCartDataUseCase({required this.homeRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return homeRepository.getCartData();
  }
}
