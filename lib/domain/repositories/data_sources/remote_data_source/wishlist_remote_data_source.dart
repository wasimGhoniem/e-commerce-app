import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/AddToWishlistResponseEntity.dart';
import '../../../entities/DeleteWishlistResponseEntity.dart';
import '../../../entities/GetWishlistResponseEntity.dart';

abstract class WishlistRemoteDataSource {
  Future<Either<Failures, AddToWishlistResponseEntity>> addProductToWishlist(
      String productId);

  Future<Either<Failures, GetWishlistResponseEntity>> getWishlistItems();

  Future<Either<Failures, DeleteWishlistResponseEntity>> deleteWishlistItems(
      String productId);
}
