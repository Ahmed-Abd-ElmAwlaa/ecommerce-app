import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/baseError..dart';
import 'package:ecommerce/domain/dataSourceContract/CartRemoteDataSourceContract.dart';
import 'package:ecommerce/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce/domain/repositoryContract/CartRepositoryContract.dart';

class CartRepositoryImp implements CartRepositoryContract{
  CartRemoteDataSourceContract cartRemoteDataSourceContract;
  CartRepositoryImp({required this.cartRemoteDataSourceContract});
  @override
  Future<Either<BaseError, GetCartResponseEntity>> getCart() {
    return cartRemoteDataSourceContract.getCart();
  }

  @override
  Future<Either<BaseError, GetCartResponseEntity>>
  deleteItemInCart(String productId) {
    return cartRemoteDataSourceContract.
    deleteItemInCart(productId);
  }

  @override
  Future<Either<BaseError, GetCartResponseEntity>>
  updateCountInCart(String productId, int count) {
    return cartRemoteDataSourceContract.
    updateCountInCart(productId, count);
  }

}