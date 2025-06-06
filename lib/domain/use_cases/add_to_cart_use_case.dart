import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repositories/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../entities/AddToCartResponseEntity.dart';

@injectable
class AddToCartUseCase {
  HomeRepository homeRepository;

  AddToCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId) {
    return homeRepository.addToCart(productId);
  }
}
