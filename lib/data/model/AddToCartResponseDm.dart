import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';

class AddToCartResponseDm extends AddToCartResponseEntity {
  AddToCartResponseDm({
    super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    this.statusMsg,
    super.data,
  });

  AddToCartResponseDm.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddToCartDataDm.fromJson(json['data']) : null;
  }

  String? statusMsg;
}

class AddToCartDataDm extends CartDataEntity {
  AddToCartDataDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddToCartDataDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddToCardProductsDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddToCardProductsDm extends CartProductsEntity {
  AddToCardProductsDm({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddToCardProductsDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
