import '../../../../../core/error/failures.dart';
import '../../../../../domain/entities/ProductResponseEntity.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchErrorState extends SearchStates {
  Failures failures;

  SearchErrorState({required this.failures});
}

class SearchSuccessState extends SearchStates {
  final List<ProductEntity> products;

  SearchSuccessState({required this.products});
}

class SearchToggleNameOrPriceState extends SearchStates {}

class SearchNoResultsState extends SearchStates {}
