import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/data/model/AddToCartResponseDm.dart';
import 'package:e_commerce_app/data/model/GetCartResponseDm.dart';
import 'package:e_commerce_app/data/model/ProductResponseDm.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/end_points.dart';
import '../../../core/error/failures.dart';
import '../../model/BrandResponseDM.dart';
import '../../model/CategoryResponseDM.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failures, CategoryResponseDm>> getAllCategories() async {
    try {
      var connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.mobile) ||
          connectivity.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
            endPoint: EndPoints.getAllCategoriesApi,
            options: Options(
              sendTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(seconds: 30),
            ));
        var getAllCategoriesResponse =
            CategoryResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(getAllCategoriesResponse);
        } else {
          return left(
              ServerError(errorMessage: getAllCategoriesResponse.message!));
        }
      } else {
        return left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, BrandResponseDm>> getAllBrands() async {
    try {
      var connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.mobile) ||
          connectivity.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
            endPoint: EndPoints.getAllBrandsApi,
            options: Options(
              sendTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(seconds: 30),
            ));
        var getAllBrandsResponse = BrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(getAllBrandsResponse);
        } else {
          return left(ServerError(errorMessage: getAllBrandsResponse.message!));
        }
      } else {
        return left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDm>> getAllProducts() async {
    try {
      var connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.mobile) ||
          connectivity.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
            endPoint: EndPoints.getAllProducts,
            options: Options(
              sendTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(seconds: 30),
            ));
        var getAllProductsResponse = ProductResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(getAllProductsResponse);
        } else {
          return left(
              ServerError(errorMessage: getAllProductsResponse.message!));
        }
      } else {
        return left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddToCartResponseDm>> addToCart(
      String productId) async {
    try {
      var connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.mobile) ||
          connectivity.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.getData(key: 'token');

        var response = await apiManager.postData(
            endPoint: EndPoints.addToCartApi,
            body: {"productId": productId},
            headers: {'token': token});

        var addToCartResponse = AddToCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(addToCartResponse);
        } else {
          return left(ServerError(errorMessage: addToCartResponse.message!));
        }
      } else {
        return left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDm>> getCartData() async {
    try {
      var connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.mobile) ||
          connectivity.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.getData(key: 'token');

        var response = await apiManager.getData(
            endPoint: EndPoints.addToCartApi, headers: {'token': token});

        var getCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(getCartResponse);
        } else {
          return left(ServerError(errorMessage: getCartResponse.message!));
        }
      } else {
        return left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDm>> deleteItemsInCart(
      String productId) async {
    try {
      var connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.mobile) ||
          connectivity.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.getData(key: 'token');

        var response = await apiManager.deleteData(
            endPoint: '${EndPoints.deleteWishlistItemsApi}/$productId',
            headers: {'token': token});

        var getCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(getCartResponse);
        } else {
          return left(ServerError(errorMessage: getCartResponse.message!));
        }
      } else {
        return left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateItemsInCart(
      String productId, int count) async {
    try {
      var connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.mobile) ||
          connectivity.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.getData(key: 'token');

        var response = await apiManager.updateData(
            endPoint: '${EndPoints.addToCartApi}/$productId',
            body: {'count': '$count'},
            headers: {'token': token});

        var getCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(getCartResponse);
        } else {
          return left(ServerError(errorMessage: getCartResponse.message!));
        }
      } else {
        return left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
