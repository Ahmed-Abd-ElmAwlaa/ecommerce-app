import 'package:dartz/dartz.dart';

import '../../data/api/baseError..dart';
import '../entities/GetCartResponseEntity.dart';

abstract class CartRemoteDataSourceContract{
  Future<Either<BaseError, GetCartResponseEntity> > getCart();
  Future<Either<BaseError, GetCartResponseEntity> >
  deleteItemInCart(String productId);
  Future<Either<BaseError, GetCartResponseEntity> >
  updateCountInCart(String productId,int count);
}