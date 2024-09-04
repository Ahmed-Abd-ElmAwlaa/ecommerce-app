import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/GetCartResponseEntity.dart';
import '../../data/api/baseError..dart';

abstract class CartRepositoryContract{
  Future<Either<BaseError, GetCartResponseEntity> > getCart();
  Future<Either<BaseError, GetCartResponseEntity> >
  deleteItemInCart(String productId);
  Future<Either<BaseError, GetCartResponseEntity> >
  updateCountInCart(String productId,int count);
}