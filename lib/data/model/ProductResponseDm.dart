import 'package:e_commerce_app/data/model/CategoryResponseDM.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';

import 'BrandResponseDM.dart';

class ProductResponseDm extends ProductResponseEntity {
  ProductResponseDm(
      {super.results,
      super.metadata,
      super.data,
      this.message,
      this.statusMsg});

  ProductResponseDm.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDataDm.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class ProductDataDm extends ProductEntity {
  ProductDataDm({
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
  });

  ProductDataDm.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
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
        ? CategoryDataDm.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? BrandDm.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }
}

class Subcategory extends ProductSubcategory {
  Subcategory({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class Metadata extends ProductMetadata {
  Metadata({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
}
