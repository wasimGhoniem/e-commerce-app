import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/data/model/LoginResponseDM.dart';
import 'package:e_commerce_app/data/model/RegisterResponseDM.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDm>> register(String name, String email, String password, String rePassword, String phone)async {
    try{
      var connectivity=await Connectivity().checkConnectivity();
      if(connectivity.contains(ConnectivityResult.mobile)||connectivity.contains(ConnectivityResult.wifi)){
        var response=await apiManager.postData(
            endPoint: EndPoints.registerApi,
            body: {
              "name": name,
              "email":email,
              "password":password,
              "rePassword":rePassword,
              "phone":phone
            }

        );
        var registerResponse= RegisterResponseDm.fromJson(response.data);
        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(registerResponse);
        }else{
          return left(ServerError(errorMessage:registerResponse.message! ));
        }
      } else {
        return Left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseDm>> login(
      String email, String password) async {
    try {
      var connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.mobile) ||
          connectivity.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.postData(
            endPoint: EndPoints.loginApi,
            body: {"email": email, "password": password});
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return right(loginResponse);
        } else {
          return left(ServerError(errorMessage: loginResponse.message!));
        }
      } else {
        return left(NetworkError(errorMessage: 'no internet connection'));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }
}