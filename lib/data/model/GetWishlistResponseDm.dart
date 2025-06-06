import 'package:e_commerce_app/domain/entities/GetWishlistResponseEntity.dart';

class GetWishlistResponseDm extends GetWishlistResponseEntity {
  GetWishlistResponseDm({
    super.status,
    this.statusMsg,
    this.message,
    super.count,
    super.data,
  });

  GetWishlistResponseDm.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];

    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GetWishlistDataDm.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class GetWishlistDataDm extends WishlistDataEntity {
  GetWishlistDataDm({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  GetWishlistDataDm.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(WishlistSubcategoryDm.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? WishlistCategoryDm.fromJson(json['category'])
        : null;
    brand =
        json['brand'] != null ? WishlistBrandDm.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
}

class WishlistBrandDm extends WishlistBrandEntity {
  WishlistBrandDm({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  WishlistBrandDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class WishlistCategoryDm extends WishlistCategoryEntity {
  WishlistCategoryDm({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  WishlistCategoryDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class WishlistSubcategoryDm extends WishlistSubcategoryEntity {
  WishlistSubcategoryDm({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  WishlistSubcategoryDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
