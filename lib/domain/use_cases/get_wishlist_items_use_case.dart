import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AddToWishlistResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/GetWishlistResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';

@injectable
class GetWishlistItemsUseCase {
  WishlistRepository wishlistRepository;

  GetWishlistItemsUseCase({required this.wishlistRepository});

  Future<Either<Failures, GetWishlistResponseEntity>> invoke() {
    return wishlistRepository.getWishlistItems();
  }
}
