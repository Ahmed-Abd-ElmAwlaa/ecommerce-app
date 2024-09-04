import 'package:dartz/dartz.dart';

import '../../data/api/baseError..dart';
import '../entities/GetCartResponseEntity.dart';
import '../repositoryContract/CartRepositoryContract.dart';

class UpdateCountInCartUseCase{
  CartRepositoryContract cartRepositoryContract;
  UpdateCountInCartUseCase({required this.cartRepositoryContract});
  Future<Either<BaseError, GetCartResponseEntity> >
  invoke(String productId,int count){
    return cartRepositoryContract.
    updateCountInCart(productId,count);
  }
}