import 'package:e_commerce_app/domain/entities/DeleteWishlistResponseEntity.dart';

class DeleteWishlistResponseDm extends DeleteWishlistResponseEntity {
  DeleteWishlistResponseDm({
    super.status,
    this.statusMsg,
    super.message,
    super.data,
  });

  DeleteWishlistResponseDm.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];

    // ✅ Fixed: Safe casting for different data types
    if (json['data'] != null) {
      if (json['data'] is List) {
        // If data is a List, convert to List<String>
        data = List<String>.from(json['data']);
      } else if (json['data'] is String) {
        // If data is a single String, wrap in a list
        data = [json['data']];
      } else {
        // If data is some other type, convert to string and wrap in list
        data = [json['data'].toString()];
      }
    } else {
      data = [];
    }
  }

  String? statusMsg;
}
