import 'package:e_commerce_app/domain/entities/BrandResponseEntity.dart';

class BrandResponseDm extends BrandResponseEntity {
  BrandResponseDm(
      {super.results,
      super.metadata,
      super.data,
      this.message,
      this.statusMsg});

  BrandResponseDm.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BrandDm.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class BrandDm extends BrandEntity {
  BrandDm({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  BrandDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class Metadata extends BrandMetadataEntity {
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
