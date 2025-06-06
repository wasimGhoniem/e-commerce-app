import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../repositories/repositories/auth_repository.dart';

@injectable
class GetAllCategoriesUseCases {
  HomeRepository homeRepository;

  GetAllCategoriesUseCases({required this.homeRepository});

  Future<Either<Failures, CategoryResponseEntity>> invoke() {
    return homeRepository.getAllCategories();
  }
}
