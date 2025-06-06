import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';

class CategoryResponseDm extends CategoryResponseEntity {
  CategoryResponseDm(
      {super.results,
      super.metadata,
      super.data,
      this.statusMsg,
      this.message});

  CategoryResponseDm.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDataDm.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class CategoryDataDm extends CategoryDataEntity {
  CategoryDataDm({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  CategoryDataDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class Metadata extends CategoryMetadataEntity {
  Metadata({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
