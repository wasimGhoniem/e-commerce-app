import 'package:e_commerce_app/domain/entities/AddToWishlistResponseEntity.dart';

class AddToWishlistResponseDm extends AddToWishlistResponseEntity {
  AddToWishlistResponseDm({
    super.status,
    this.statusMsg,
    super.message,
    super.data,
  });

  AddToWishlistResponseDm.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  String? statusMsg;
}
