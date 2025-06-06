import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/product/cubit/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../cart_screen/cubit/cart_view_model.dart';

@injectable
class ProductScreenViewModel extends Cubit<ProductStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductScreenViewModel(
      {required this.getAllProductsUseCase, required this.addToCartUseCase})
      : super(ProductInitialStates());

  List<ProductEntity> productList = [];
  Set<String> wishlistProductIds = {};

  void getAllProducts() async {
    emit(ProductLoadingStates());
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) {
      emit(ProductErrorStates(failures: error));
    }, (response) {
      productList = response.data!;
      emit(ProductSuccessStates(productResponseEntity: response));
    });
  }

  void addToCart(String productId, BuildContext context) async {
    var either = await addToCartUseCase.invoke(productId);
    either.fold((error) {
      emit(AddCartErrorStates(failures: error));
    }, (response) {
      CartViewModel.get(context).getCartData();
      emit(AddCartSuccessStates(addToCartResponseEntity: response));
    });
  }

  void toggleWishlist(String productId) {
    if (wishlistProductIds.contains(productId)) {
      wishlistProductIds.remove(productId);
    } else {
      wishlistProductIds.add(productId);
    }
    emit(ChangeWishListIconStates());
  }

  static ProductScreenViewModel get(context) {
    return BlocProvider.of(context);
  }
}
