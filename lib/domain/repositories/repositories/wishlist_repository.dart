import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/DeleteWishlistResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/GetWishlistResponseEntity.dart';

import '../../../core/error/failures.dart';
import '../../entities/AddToWishlistResponseEntity.dart';

abstract class WishlistRepository {
  Future<Either<Failures, AddToWishlistResponseEntity>> addProductToWishlist(
      String productId);

  Future<Either<Failures, GetWishlistResponseEntity>> getWishlistItems();

  Future<Either<Failures, DeleteWishlistResponseEntity>> deleteWishlistItems(
      String productId);
}
