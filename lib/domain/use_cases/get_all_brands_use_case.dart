import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repositories/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../entities/BrandResponseEntity.dart';

@injectable
class GetAllBrandsUseCase {
  HomeRepository homeRepository;

  GetAllBrandsUseCase({required this.homeRepository});

  Future<Either<Failures, BrandResponseEntity>> invoke() {
    return homeRepository.getAllBrands();
  }
}
