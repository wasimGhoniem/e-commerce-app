import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AddToWishlistResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';

@injectable
class AddProductToWishlistUseCase {
  WishlistRepository wishlistRepository;

  AddProductToWishlistUseCase({required this.wishlistRepository});

  Future<Either<Failures, AddToWishlistResponseEntity>> invoke(
      String productId) {
    return wishlistRepository.addProductToWishlist(productId);
  }
}
