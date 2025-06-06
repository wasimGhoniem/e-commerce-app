import 'package:e_commerce_app/domain/entities/BrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';

class ProductResponseEntity {
  ProductResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });

  num? results;
  ProductMetadata? metadata;
  List<ProductEntity>? data;
}

class ProductEntity {
  ProductEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  num? sold;
  List<String>? images;
  List<ProductSubcategory>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryDataEntity? category;
  BrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
}

class ProductSubcategory {
  ProductSubcategory({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  String? id;
  String? name;
  String? slug;
  String? category;
}

class ProductMetadata {
  ProductMetadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;
}
