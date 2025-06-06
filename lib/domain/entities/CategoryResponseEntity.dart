class CategoryResponseEntity {
  CategoryResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });

  int? results;
  CategoryMetadataEntity? metadata;
  List<CategoryDataEntity>? data;
}

class CategoryDataEntity {
  CategoryDataEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
}

class CategoryMetadataEntity {
  CategoryMetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  int? currentPage;
  int? numberOfPages;
  int? limit;
}
