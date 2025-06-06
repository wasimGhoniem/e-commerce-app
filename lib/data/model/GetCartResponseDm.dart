import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';

import 'ProductResponseDm.dart';

class GetCartResponseDm extends GetCartResponseEntity {
  GetCartResponseDm({
    super.status,
    this.statusMsg,
    this.message,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  GetCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetCartDataDm.fromJson(json['data']) : null;
  }

  String? message;
  String? statusMsg;
}

class GetCartDataDm extends GetCartDataEntity {
  GetCartDataDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetCartDataDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetCartProductsDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetCartProductsDm extends GetCartProductsEntity {
  GetCartProductsDm({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetCartProductsDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? ProductDataDm.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}
