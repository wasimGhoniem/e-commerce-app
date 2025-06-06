class BrandResponseEntity {
  BrandResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });

  int? results;
  BrandMetadataEntity? metadata;
  List<BrandEntity>? data;
}

class BrandEntity {
  BrandEntity({
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

class BrandMetadataEntity {
  BrandMetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;
}
