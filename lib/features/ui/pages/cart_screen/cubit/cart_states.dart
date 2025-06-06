import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';

abstract class CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  GetCartSuccessState({required this.getCartResponseEntity});
}

class GetCartErrorState extends CartStates {
  Failures failures;

  GetCartErrorState({required this.failures});
}

//delete states
class DeleteItemInCartLoadingState extends CartStates {}

class DeleteItemInCartSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  DeleteItemInCartSuccessState({required this.getCartResponseEntity});
}

class DeleteItemInCartErrorState extends CartStates {
  Failures failures;

  DeleteItemInCartErrorState({required this.failures});
}

//update states
class UpdateItemInCartLoadingState extends CartStates {}

class UpdateItemInCartSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  UpdateItemInCartSuccessState({required this.getCartResponseEntity});
}

class UpdateItemInCartErrorState extends CartStates {
  Failures failures;

  UpdateItemInCartErrorState({required this.failures});
}
