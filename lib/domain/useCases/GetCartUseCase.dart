import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/repositoryContract/CartRepositoryContract.dart';

import '../../data/api/baseError..dart';
import '../entities/GetCartResponseEntity.dart';

class GetCartUseCase{
  CartRepositoryContract cartRepositoryContract;
  GetCartUseCase({required this.cartRepositoryContract});
  Future<Either<BaseError, GetCartResponseEntity> > invoke(){
     return cartRepositoryContract.getCart();
  }
}