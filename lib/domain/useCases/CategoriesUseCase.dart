import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/repositoryContract/HomeRepositoryContract.dart';

import '../../data/api/baseError..dart';
import '../entities/CategoryOrBrandResponseEntity.dart';

class GetCategoriesUseCase{
  HomeRepositoryContract homeRepositoryContract;
  GetCategoriesUseCase({required this.homeRepositoryContract});
  Future<Either<BaseError, CategoryOrBrandResponseEntity>>invoke(){
    return homeRepositoryContract.getCategories();
  }
}