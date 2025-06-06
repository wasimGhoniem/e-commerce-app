import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/domain/entities/AddToWishlistResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/DeleteWishlistResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/GetWishlistResponseEntity.dart';

abstract class WishlistStates {}

class WishlistLoadingState extends WishlistStates {}

class WishlistErrorState extends WishlistStates {
  Failures failures;

  WishlistErrorState({required this.failures});
}

class WishlistSuccessState extends WishlistStates {
  AddToWishlistResponseEntity addToWishlistResponseEntity;

  WishlistSuccessState({required this.addToWishlistResponseEntity});
}

//get wishlist items states
class GetWishlistLoadingState extends WishlistStates {}

class GetWishlistErrorState extends WishlistStates {
  Failures failures;

  GetWishlistErrorState({required this.failures});
}

class GetWishlistSuccessState extends WishlistStates {
  GetWishlistResponseEntity getWishlistResponseEntity;

  GetWishlistSuccessState({required this.getWishlistResponseEntity});
}

//delete wishlist items states
class DeleteWishlistLoadingState extends WishlistStates {}

class DeleteWishlistErrorState extends WishlistStates {
  Failures failures;

  DeleteWishlistErrorState({required this.failures});
}

class DeleteWishlistSuccessState extends WishlistStates {
  DeleteWishlistResponseEntity deleteWishlistResponseEntity;

  DeleteWishlistSuccessState({required this.deleteWishlistResponseEntity});
}
