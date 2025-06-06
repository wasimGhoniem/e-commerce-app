// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../core/services/navigation_service.dart' as _i340;
import '../data/data_sources/local_data_sources_imp/profile_local_data_source_imp.dart'
    as _i1011;
import '../data/data_sources/remote_data_sources_imp/auth_remote_data_source_impl.dart'
    as _i203;
import '../data/data_sources/remote_data_sources_imp/home_remote_data_source_imp.dart'
    as _i646;
import '../data/data_sources/remote_data_sources_imp/update_logged_user_remote_data_source_imp.dart'
    as _i535;
import '../data/data_sources/remote_data_sources_imp/wishlist_remote_data_source_imp.dart'
    as _i819;
import '../data/repositories/auth_repository_impl.dart' as _i74;
import '../data/repositories/home_repository_imp.dart' as _i596;
import '../data/repositories/profile_repository_imp.dart' as _i450;
import '../data/repositories/wishlist_repository_imp.dart' as _i380;
import '../domain/repositories/data_sources/local_data_source/profile_local_data_source.dart'
    as _i779;
import '../domain/repositories/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i380;
import '../domain/repositories/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i626;
import '../domain/repositories/data_sources/remote_data_source/update_logged_user_remote_data_source.dart'
    as _i658;
import '../domain/repositories/data_sources/remote_data_source/wishlist_remote_data_source.dart'
    as _i1052;
import '../domain/repositories/repositories/auth_repository.dart' as _i302;
import '../domain/repositories/repositories/home_repository.dart' as _i659;
import '../domain/repositories/repositories/profile_repository.dart' as _i85;
import '../domain/repositories/repositories/wishlist_repository.dart' as _i928;
import '../domain/use_cases/add_product_to_wishlist_use_case.dart' as _i104;
import '../domain/use_cases/add_to_cart_use_case.dart' as _i994;
import '../domain/use_cases/delete_item_from_wishlist_use_case.dart' as _i141;
import '../domain/use_cases/delete_item_in_cart_use_case.dart' as _i1013;
import '../domain/use_cases/get_all_brands_use_case.dart' as _i823;
import '../domain/use_cases/get_all_categories_use_cases.dart' as _i197;
import '../domain/use_cases/get_all_products_use_case.dart' as _i960;
import '../domain/use_cases/get_cart_data_use_case.dart' as _i180;
import '../domain/use_cases/get_user_data_use_case.dart' as _i425;
import '../domain/use_cases/get_wishlist_items_use_case.dart' as _i29;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../domain/use_cases/update_item_in_cart_use_case.dart' as _i257;
import '../domain/use_cases/update_logged_user_use_case.dart' as _i710;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/auth/register/cubit/register_view_model.dart' as _i586;
import '../features/ui/pages/cart_screen/cubit/cart_view_model.dart' as _i65;
import '../features/ui/pages/home_tap/cubit/home_tap_view_model.dart' as _i666;
import '../features/ui/pages/product/cubit/product_screen_view_model.dart'
    as _i28;
import '../features/ui/pages/profile/cubit/profile_view_model.dart' as _i672;
import '../features/ui/pages/search_screen/cubit/search_view_model.dart'
    as _i352;
import '../features/ui/pages/wishlist_screen/cubit/wishlist_view_model.dart'
    as _i750;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.singleton<_i340.NavigationService>(() => _i340.NavigationService());
    gh.factory<_i779.ProfileLocalDataSource>(
        () => _i1011.ProfileLocalDataSourceImp());
    gh.factory<_i1052.WishlistRemoteDataSource>(() =>
        _i819.WishlistRemoteDataSourceImp(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i380.AuthRemoteDataSource>(() =>
        _i203.AuthRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i658.UpdateLoggedUserRemoteDataSource>(() =>
        _i535.UpdateLoggedUserRemoteDataSourceImp(
            apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i626.HomeRemoteDataSource>(() =>
        _i646.HomeRemoteDataSourceImp(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i659.HomeRepository>(() => _i596.HomeRepositoryImp(
        homeRemoteDataSource: gh<_i626.HomeRemoteDataSource>()));
    gh.factory<_i85.ProfileRepository>(() => _i450.ProfileRepositoryImp(
          profileLocalDataSource: gh<_i779.ProfileLocalDataSource>(),
          updateLoggedUserRemoteDataSource:
              gh<_i658.UpdateLoggedUserRemoteDataSource>(),
        ));
    gh.factory<_i928.WishlistRepository>(() => _i380.WishlistRepositoryImp(
        wishlistRemoteDataSource: gh<_i1052.WishlistRemoteDataSource>()));
    gh.factory<_i104.AddProductToWishlistUseCase>(() =>
        _i104.AddProductToWishlistUseCase(
            wishlistRepository: gh<_i928.WishlistRepository>()));
    gh.factory<_i141.DeleteItemFromWishlistUseCase>(() =>
        _i141.DeleteItemFromWishlistUseCase(
            wishlistRepository: gh<_i928.WishlistRepository>()));
    gh.factory<_i29.GetWishlistItemsUseCase>(() => _i29.GetWishlistItemsUseCase(
        wishlistRepository: gh<_i928.WishlistRepository>()));
    gh.factory<_i302.AuthRepository>(() => _i74.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i380.AuthRemoteDataSource>()));
    gh.factory<_i750.WishlistViewModel>(() => _i750.WishlistViewModel(
          addProductToWishlistUseCase: gh<_i104.AddProductToWishlistUseCase>(),
          getWishlistItemsUseCase: gh<_i29.GetWishlistItemsUseCase>(),
          deleteItemFromWishlistUseCase:
              gh<_i141.DeleteItemFromWishlistUseCase>(),
        ));
    gh.factory<_i425.GetUserDataUseCase>(() => _i425.GetUserDataUseCase(
        profileRepository: gh<_i85.ProfileRepository>()));
    gh.factory<_i710.UpdateLoggedUserUseCase>(() =>
        _i710.UpdateLoggedUserUseCase(
            profileRepository: gh<_i85.ProfileRepository>()));
    gh.factory<_i994.AddToCartUseCase>(() =>
        _i994.AddToCartUseCase(homeRepository: gh<_i659.HomeRepository>()));
    gh.factory<_i1013.DeleteItemInCartUseCase>(() =>
        _i1013.DeleteItemInCartUseCase(
            homeRepository: gh<_i659.HomeRepository>()));
    gh.factory<_i823.GetAllBrandsUseCase>(() =>
        _i823.GetAllBrandsUseCase(homeRepository: gh<_i659.HomeRepository>()));
    gh.factory<_i197.GetAllCategoriesUseCases>(() =>
        _i197.GetAllCategoriesUseCases(
            homeRepository: gh<_i659.HomeRepository>()));
    gh.factory<_i960.GetAllProductsUseCase>(() => _i960.GetAllProductsUseCase(
        homeRepository: gh<_i659.HomeRepository>()));
    gh.factory<_i180.GetCartDataUseCase>(() =>
        _i180.GetCartDataUseCase(homeRepository: gh<_i659.HomeRepository>()));
    gh.factory<_i257.UpdateItemInCartUseCase>(() =>
        _i257.UpdateItemInCartUseCase(
            homeRepository: gh<_i659.HomeRepository>()));
    gh.factory<_i666.HomeTapViewModel>(() => _i666.HomeTapViewModel(
          getAllCategoriesUseCases: gh<_i197.GetAllCategoriesUseCases>(),
          getAllBrandsUseCase: gh<_i823.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i826.LoginUseCase>(
        () => _i826.LoginUseCase(authRepository: gh<_i302.AuthRepository>()));
    gh.factory<_i772.RegisterUseCase>(() =>
        _i772.RegisterUseCase(authRepository: gh<_i302.AuthRepository>()));
    gh.factory<_i28.ProductScreenViewModel>(() => _i28.ProductScreenViewModel(
          getAllProductsUseCase: gh<_i960.GetAllProductsUseCase>(),
          addToCartUseCase: gh<_i994.AddToCartUseCase>(),
        ));
    gh.factory<_i1040.LoginViewModel>(() => _i1040.LoginViewModel(
          loginUseCase: gh<_i826.LoginUseCase>(),
          navigationService: gh<_i340.NavigationService>(),
        ));
    gh.factory<_i352.SearchViewModel>(
        () => _i352.SearchViewModel(gh<_i960.GetAllProductsUseCase>()));
    gh.factory<_i65.CartViewModel>(() => _i65.CartViewModel(
          getCartDataUseCase: gh<_i180.GetCartDataUseCase>(),
          deleteItemInCartUseCase: gh<_i1013.DeleteItemInCartUseCase>(),
          updateItemInCartUseCase: gh<_i257.UpdateItemInCartUseCase>(),
        ));
    gh.factory<_i672.ProfileViewModel>(() => _i672.ProfileViewModel(
          getUserDataUseCase: gh<_i425.GetUserDataUseCase>(),
          updateLoggedUserUseCase: gh<_i710.UpdateLoggedUserUseCase>(),
        ));
    gh.factory<_i586.RegisterViewModel>(() =>
        _i586.RegisterViewModel(registerUseCase: gh<_i772.RegisterUseCase>()));
    return this;
  }
}
