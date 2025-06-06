import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/data/model/UpdatedLoggedUserResponseDm.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/remote_data_source/update_logged_user_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../core/cache/shared_preference_utils.dart';

@Injectable(as: UpdateLoggedUserRemoteDataSource)
class UpdateLoggedUserRemoteDataSourceImp
    implements UpdateLoggedUserRemoteDataSource {
  ApiManager apiManager;

  UpdateLoggedUserRemoteDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failures, UpdatedLoggedUserResponseDm>> updateLoggedUserData(
      String name, String email, String phone) async {
    try {
      var connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.mobile) ||
          connectivity.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.getData(key: 'token');

        var response = await apiManager.updateData(
            endPoint: EndPoints.updateLoggedUseApi,
            body: {"name": name, "email": email, "phone": phone},
            headers: {'token': token});

        var updateLoggedUserResponse =
            UpdatedLoggedUserResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(updateLoggedUserResponse);
        } else {
          return left(
              ServerError(errorMessage: updateLoggedUserResponse.message!));
        }
      } else {
        return left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
