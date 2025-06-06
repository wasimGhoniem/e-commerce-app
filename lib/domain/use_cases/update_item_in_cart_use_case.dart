import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../repositories/repositories/home_repository.dart';

@injectable
class UpdateItemInCartUseCase {
  HomeRepository homeRepository;

  UpdateItemInCartUseCase({required this.homeRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke(
      String productId, int count) {
    return homeRepository.updateItemsInCart(productId, count);
  }
}
