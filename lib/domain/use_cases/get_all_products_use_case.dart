import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  HomeRepository homeRepository;

  GetAllProductsUseCase({required this.homeRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return homeRepository.getAllProducts();
  }
}
