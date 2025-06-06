import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/search_screen/cubit/search_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchViewModel extends Cubit<SearchStates> {
  final GetAllProductsUseCase getAllProductsUseCase;

  SearchViewModel(this.getAllProductsUseCase) : super(SearchInitialState());

  bool isSearchByName = true;
  List<ProductEntity> _allProducts = [];
  List<ProductEntity> searchResults = [];
  bool _isProductsFetched = false;
  final TextEditingController searchController = TextEditingController();

  void toggleSearchCriteria() {
    isSearchByName = !isSearchByName;
    emit(SearchToggleNameOrPriceState());
  }

  Future<void> _fetchAllProductsIfNeeded() async {
    if (_isProductsFetched) return;

    emit(SearchLoadingState());

    var result = await getAllProductsUseCase.invoke();

    result.fold(
      (failure) => emit(SearchErrorState(failures: failure)),
      (response) {
        _allProducts = response.data ?? [];
        _isProductsFetched = true;
      },
    );
  }

  void filterProducts(String query) async {
    if (query.trim().isEmpty) {
      searchResults = [];
      emit(SearchInitialState());
      return;
    }

    if (!_isProductsFetched) {
      await _fetchAllProductsIfNeeded();

      if (state is SearchErrorState) return;
    }

    searchResults = _allProducts.where((product) {
      if (isSearchByName) {
        return product.title?.toLowerCase().contains(query.toLowerCase()) ??
            false;
      } else {
        final queryPrice = num.tryParse(query);
        if (queryPrice == null) return false;

        final halfQueryPrice = queryPrice / 2;
        return product.price! >= halfQueryPrice && product.price! <= queryPrice;
      }
    }).toList();

    if (searchResults.isEmpty) {
      emit(SearchNoResultsState());
    } else {
      emit(SearchSuccessState(products: searchResults));
    }
  }

  void clearSearch() {
    searchResults = [];
    emit(SearchInitialState());
  }

  void resetSearch() {
    searchResults = [];
    _allProducts = [];
    _isProductsFetched = false;
    isSearchByName = true;
    emit(SearchInitialState());
  }
}
