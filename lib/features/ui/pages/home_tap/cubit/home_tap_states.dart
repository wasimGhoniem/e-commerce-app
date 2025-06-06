import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';

import '../../../../../domain/entities/BrandResponseEntity.dart';

abstract class HomeTapStates {}

class HomeDataState extends HomeTapStates {
  List<CategoryDataEntity> categoryList;
  List<BrandEntity> brandList;
  bool isCategoryLoading;
  bool isBrandLoading;
  Failures? brandFailures;
  Failures? categoryFailures;
  Failures? failure;

  HomeDataState(
      {this.brandList = const [],
      this.categoryList = const [],
      this.isBrandLoading = false,
      this.isCategoryLoading = false,
      this.brandFailures,
      this.categoryFailures,
      this.failure});

  HomeDataState copyWith(
      {List<CategoryDataEntity>? categoryList,
      List<BrandEntity>? brandList,
      bool? isCategoryLoading,
      bool? isBrandLoading,
      Failures? brandFailures,
      Failures? categoryFailures,
      Failures? failure}) {
    return HomeDataState(
      categoryList: categoryList ?? this.categoryList,
      brandList: brandList ?? this.brandList,
      isBrandLoading: isBrandLoading ?? this.isBrandLoading,
      isCategoryLoading: isCategoryLoading ?? this.isCategoryLoading,
      brandFailures: brandFailures ?? this.brandFailures,
      categoryFailures: categoryFailures ?? this.categoryFailures,
      failure: failure ?? this.failure,
    );
  }
}

/* CategoryResponseEntity? responseEntity;
  BrandResponseEntity? responseEntity;
  */
