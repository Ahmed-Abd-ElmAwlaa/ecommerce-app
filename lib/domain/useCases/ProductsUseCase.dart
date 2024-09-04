import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/repositoryContract/HomeRepositoryContract.dart';
import '../../data/api/baseError..dart';
import '../entities/ProductResponseEntity.dart';

class GetProductsUseCase{
  HomeRepositoryContract homeRepositoryContract;
  GetProductsUseCase({required this.homeRepositoryContract});

  Future<Either<BaseError, ProductResponseEntity> > invoke(){
    return homeRepositoryContract.getProducts();
  }
}