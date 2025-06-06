import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/BrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:e_commerce_app/domain/repositories/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImp({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failures, BrandResponseEntity>> getAllBrands() async {
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) async {
    var either = await homeRemoteDataSource.addToCart(productId);
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCartData() async {
    var either = await homeRemoteDataSource.getCartData();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemsInCart(
      String productId) async {
    var either = await homeRemoteDataSource.deleteItemsInCart(productId);
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateItemsInCart(
      String productId, int count) async {
    var either = await homeRemoteDataSource.updateItemsInCart(productId, count);
    return either.fold((error) => left(error), (response) => right(response));
  }
}
