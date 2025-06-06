import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/AddToCartResponseEntity.dart';
import '../../../entities/BrandResponseEntity.dart';
import '../../../entities/CategoryResponseEntity.dart';
import '../../../entities/GetCartResponseEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories();

  Future<Either<Failures, BrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  //cart
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);

  Future<Either<Failures, GetCartResponseEntity>> getCartData();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemsInCart(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateItemsInCart(
      String productId, int count);
}
