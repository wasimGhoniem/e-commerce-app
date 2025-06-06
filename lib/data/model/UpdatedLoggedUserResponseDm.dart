import 'package:e_commerce_app/domain/entities/UpdateLoggedUserResponseEntity.dart';

class UpdatedLoggedUserResponseDm extends UpdateLoggedUserResponseEntity {
  UpdatedLoggedUserResponseDm({
    super.message,
    super.user,
  });

  UpdatedLoggedUserResponseDm.fromJson(dynamic json) {
    message = json['message'];
    user =
        json['user'] != null ? UpdateLoggedUserDm.fromJson(json['user']) : null;
  }
}

class UpdateLoggedUserDm extends UpdateLoggedUserEntity {
  UpdateLoggedUserDm({
    super.name,
    super.email,
    super.role,
  });

  UpdateLoggedUserDm.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}
