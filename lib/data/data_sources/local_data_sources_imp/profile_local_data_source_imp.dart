import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/domain/entities/user_data_response_entity.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/local_data_source/profile_local_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../core/cache/shared_preference_utils.dart';
import '../../model/user_data_response_dm.dart';

@Injectable(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImp implements ProfileLocalDataSource {
  @override
  Future<Either<Failures, UserDataResponseEntity>> getUserData() async {
    try {
      print('Attempting to retrieve user data from shared preferences...');
      String? name = SharedPreferenceUtils.getData(key: 'user_name') as String?;
      print('Retrieved user_name: $name');
      String? email =
          SharedPreferenceUtils.getData(key: 'user_email') as String?;
      print('Retrieved user_email: $email');
      String? mobile =
          SharedPreferenceUtils.getData(key: 'user_mobile') as String?;
      print('Retrieved user_mobile: $mobile');
      String? address =
          SharedPreferenceUtils.getData(key: 'user_address') as String?;
      print('Retrieved user_address: $address');
      String? password =
          SharedPreferenceUtils.getData(key: 'user_password') as String?;
      print('Retrieved user_password: $password');

      if ([name, email, mobile, address, password].any((e) => e == null)) {
        print('User data incomplete: One or more values are null.');
        return left(Failures(errorMessage: 'User data is incomplete'));
      }
      UserDataResponseDm response =
          UserDataResponseDm(name!, mobile!, password!, email!, address!);
      print('Successfully retrieved and mapped user data.');
      return right(response);
    } catch (e) {
      print('Error retrieving user data: $e');
      return left(NetworkError(errorMessage: 'Error loading user data: $e'));
    }
  }
}
