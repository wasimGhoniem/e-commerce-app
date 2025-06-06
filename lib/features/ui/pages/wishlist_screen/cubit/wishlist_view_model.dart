import 'package:e_commerce_app/domain/use_cases/add_product_to_wishlist_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/delete_item_from_wishlist_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_wishlist_items_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/wishlist_screen/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/GetWishlistResponseEntity.dart';

@injectable
class WishlistViewModel extends Cubit<WishlistStates> {
  AddProductToWishlistUseCase addProductToWishlistUseCase;
  GetWishlistItemsUseCase getWishlistItemsUseCase;
  DeleteItemFromWishlistUseCase deleteItemFromWishlistUseCase;
  List<WishlistDataEntity> itemsList = [];

  WishlistViewModel(
      {required this.addProductToWishlistUseCase,
      required this.getWishlistItemsUseCase,
      required this.deleteItemFromWishlistUseCase})
      : super(WishlistLoadingState());

  static WishlistViewModel get(context) {
    return BlocProvider.of(context);
  }

  void addProductToWishlist(String productId) async {
    var either = await addProductToWishlistUseCase.invoke(productId);
    either.fold((error) {
      emit(WishlistErrorState(failures: error));
    }, (response) {
      emit(WishlistSuccessState(addToWishlistResponseEntity: response));
    });
  }

  void getWishlistItems() async {
    emit(GetWishlistLoadingState());
    var either = await getWishlistItemsUseCase.invoke();
    either.fold((error) {
      emit(GetWishlistErrorState(failures: error));
    }, (response) {
      print("Fetched wishlist: ${response.data}");
      itemsList = response.data!;
      emit(GetWishlistSuccessState(getWishlistResponseEntity: response));
    });
  }

  void deleteWishlistItem(String productId) async {
    var either = await deleteItemFromWishlistUseCase.invoke(productId);
    either.fold((error) {
      emit(DeleteWishlistErrorState(failures: error));
    }, (response) {
      emit(DeleteWishlistSuccessState(deleteWishlistResponseEntity: response));
      getWishlistItems();
    });
  }
}
