import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/repositoryContract/CartRepositoryContract.dart';

import '../../data/api/baseError..dart';
import '../entities/GetCartResponseEntity.dart';

class DeleteItemInCartUseCase{
  CartRepositoryContract cartRepositoryContract;
  DeleteItemInCartUseCase({required this.cartRepositoryContract});
  Future<Either<BaseError, GetCartResponseEntity> >
  invoke(String productId){
     return cartRepositoryContract.
     deleteItemInCart(productId);
  }
}