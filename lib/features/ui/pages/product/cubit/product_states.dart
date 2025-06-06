import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';

abstract class ProductStates {}

class ProductInitialStates extends ProductStates {}

class ProductLoadingStates extends ProductStates {}

class ProductErrorStates extends ProductStates {
  Failures failures;

  ProductErrorStates({required this.failures});
}

class ProductSuccessStates extends ProductStates {
  ProductResponseEntity productResponseEntity;

  ProductSuccessStates({required this.productResponseEntity});
}

class ChangeWishListIconStates extends ProductStates {}

//add cart states
class AddCartLoadingStates extends ProductStates {}

class AddCartErrorStates extends ProductStates {
  Failures failures;

  AddCartErrorStates({required this.failures});
}

class AddCartSuccessStates extends ProductStates {
  AddToCartResponseEntity addToCartResponseEntity;

  AddCartSuccessStates({required this.addToCartResponseEntity});
}
