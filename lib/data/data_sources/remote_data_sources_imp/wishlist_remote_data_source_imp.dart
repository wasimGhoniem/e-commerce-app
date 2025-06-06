import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/data/model/AddToWishlistResponseDm.dart';
import 'package:e_commerce_app/data/model/GetWishlistResponseDm.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/end_points.dart';
import '../../../core/cache/shared_preference_utils.dart';
import '../../../domain/repositories/data_sources/remote_data_source/wishlist_remote_data_source.dart';
import '../../model/delete_wishlist_response_dm.dart';

@Injectable(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImp implements WishlistRemoteDataSource {
  ApiManager apiManager;

  WishlistRemoteDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failures, AddToWishlistResponseDm>> addProductToWishlist(
      String productId) async {
    try {
      var connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.mobile) ||
          connectivity.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.getData(key: 'token');

        var response = await apiManager.postData(
            endPoint: EndPoints.addToWishlistApi,
            body: {"productId": productId},
            headers: {'token': token});

        var addToWishlistResponse =
            AddToWishlistResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(addToWishlistResponse);
        } else {
          return left(
              ServerError(errorMessage: addToWishlistResponse.message!));
        }
      } else {
        return left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetWishlistResponseDm>> getWishlistItems() async {
    try {
      var connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.mobile) ||
          connectivity.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.getData(key: 'token');

        var response = await apiManager.getData(
            endPoint: EndPoints.getWishlistItemsApi, headers: {'token': token});

        var getWishlistItemsResponse =
            GetWishlistResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(getWishlistItemsResponse);
        } else {
          return left(
              ServerError(errorMessage: getWishlistItemsResponse.message!));
        }
      } else {
        return left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, DeleteWishlistResponseDm>> deleteWishlistItems(
      String productId) async {
    try {
      var connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.mobile) ||
          connectivity.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.getData(key: 'token');

        var response = await apiManager.deleteData(
            endPoint: '${EndPoints.deleteWishlistItemsApi}/$productId',
            headers: {'token': token});

        var deleteWishlistResponse =
            DeleteWishlistResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(deleteWishlistResponse);
        } else {
          return left(
              ServerError(errorMessage: deleteWishlistResponse.message!));
        }
      } else {
        return left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
