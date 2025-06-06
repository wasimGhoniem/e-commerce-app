import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/domain/entities/BrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_categories_use_cases.dart';
import 'package:e_commerce_app/features/ui/pages/home_tap/cubit/home_tap_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTapViewModel extends Cubit<HomeTapStates> {
  GetAllCategoriesUseCases getAllCategoriesUseCases;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTapViewModel(
      {required this.getAllCategoriesUseCases,
      required this.getAllBrandsUseCase})
      : super(HomeDataState());

  List<String> imagePathList = [
    AppAssets.advPhoto1,
    AppAssets.advPhoto2,
    AppAssets.advPhoto3,
  ];

  List<BrandEntity> brandsList = [];

  List<CategoryDataEntity> categoriesList = [];
  late bool _isLoading = false;

  void getData() async {
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    emit(HomeDataState(
      isCategoryLoading: true,
      isBrandLoading: true,
      categoryList: categoriesList,
      brandList: brandsList,
    ));
    try {
      var either = await getAllCategoriesUseCases.invoke();
      either.fold((error) {
        emit((state as HomeDataState).copyWith(
          isCategoryLoading: false,
          categoryFailures: ServerError(errorMessage: error.toString()),
        ));
      }, (response) {
        categoriesList = response.data!;
        emit((state as HomeDataState).copyWith(
          categoryList: categoriesList,
          isCategoryLoading: false,
        ));
      });

      ////////
      var brandRes = await getAllBrandsUseCase.invoke();
      brandRes.fold((error) {
        emit((state as HomeDataState).copyWith(
          isBrandLoading: false,
          brandFailures: ServerError(errorMessage: error.toString()),
        ));
      }, (response) {
        brandsList = response.data!;
        emit((state as HomeDataState).copyWith(
          brandList: brandsList,
          isBrandLoading: false,
        ));
      });
    } catch (e) {
      emit((state as HomeDataState).copyWith(
          isCategoryLoading: false,
          isBrandLoading: false,
          failure: NetworkError(errorMessage: e.toString())));
    } finally {
      _isLoading = false;
    }
  }
}
