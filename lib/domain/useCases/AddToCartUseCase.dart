import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/repositoryContract/HomeRepositoryContract.dart';

import '../../data/api/baseError..dart';
import '../entities/AddToCartResponseEntity.dart';

class AddToCartUseCase {
  HomeRepositoryContract homeRepositoryContract;
  AddToCartUseCase({required this.homeRepositoryContract});
  Future<Either<BaseError, AddToCartResponseEntity> >
  invoke(String productId){
    return homeRepositoryContract.addToCart(productId);
  }
}