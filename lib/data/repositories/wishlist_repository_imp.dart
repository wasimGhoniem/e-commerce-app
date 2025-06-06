import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/domain/entities/AddToWishlistResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/DeleteWishlistResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/GetWishlistResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/remote_data_source/wishlist_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/repositories/wishlist_repository.dart';

@Injectable(as: WishlistRepository)
class WishlistRepositoryImp implements WishlistRepository {
  WishlistRemoteDataSource wishlistRemoteDataSource;

  WishlistRepositoryImp({required this.wishlistRemoteDataSource});

  @override
  Future<Either<Failures, AddToWishlistResponseEntity>> addProductToWishlist(
      String productId) async {
    var either = await wishlistRemoteDataSource.addProductToWishlist(productId);
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failures, GetWishlistResponseEntity>> getWishlistItems() async {
    var either = await wishlistRemoteDataSource.getWishlistItems();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failures, DeleteWishlistResponseEntity>> deleteWishlistItems(
      String productId) async {
    var either = await wishlistRemoteDataSource.deleteWishlistItems(productId);
    return either.fold((error) => left(error), (response) => right(response));
  }
}
