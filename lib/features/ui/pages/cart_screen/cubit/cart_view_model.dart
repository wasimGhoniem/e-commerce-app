import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_cart_data_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/update_item_in_cart_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  GetCartDataUseCase getCartDataUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  UpdateItemInCartUseCase updateItemInCartUseCase;

  CartViewModel(
      {required this.getCartDataUseCase,
      required this.deleteItemInCartUseCase,
      required this.updateItemInCartUseCase})
      : super(GetCartLoadingState());

  List<GetCartProductsEntity> productList = [];

  static CartViewModel get(context) => BlocProvider.of(context);

  int cartItemNumber = 0;

  void getCartData() async {
    emit(GetCartLoadingState());
    var either = await getCartDataUseCase.invoke();
    either.fold((error) {
      emit(GetCartErrorState(failures: error));
    }, (response) {
      productList = response.data!.products!;
      cartItemNumber = response.numOfCartItems?.toInt() ?? 0;
      emit(GetCartSuccessState(getCartResponseEntity: response));
    });
  }

  void deleteItemInCart(String productId) async {
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((error) {
      emit(DeleteItemInCartErrorState(failures: error));
    }, (response) {
      getCartData();
      emit(DeleteItemInCartSuccessState(getCartResponseEntity: response));
    });
  }

  void updateItemInCart(String productId, int count) async {
    var either = await updateItemInCartUseCase.invoke(productId, count);
    either.fold((error) {
      emit(UpdateItemInCartErrorState(failures: error));
    }, (response) {
      getCartData();
      cartItemNumber = response.numOfCartItems!.toInt();

      emit(GetCartSuccessState(getCartResponseEntity: response));
    });
  }
}
