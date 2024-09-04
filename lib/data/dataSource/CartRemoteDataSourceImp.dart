import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/apiManager.dart';
import 'package:ecommerce/data/api/baseError..dart';
import 'package:ecommerce/domain/dataSourceContract/CartRemoteDataSourceContract.dart';
import 'package:ecommerce/domain/entities/GetCartResponseEntity.dart';

class CartRemoteDataSourceImp implements CartRemoteDataSourceContract{
  ApiManager apiManager;
  CartRemoteDataSourceImp({required this.apiManager});
  @override
  Future<Either<BaseError, GetCartResponseEntity>>
  getCart() async{
    var either = await apiManager.getCart();
    return either.fold(
            (l){
          return Left(BaseError(errorMessage: l.errorMessage));
        },
            (response){
          return Right(response);
        });
  }

  @override
  Future<Either<BaseError, GetCartResponseEntity>>
  deleteItemInCart(String productId) async{
    var either = await apiManager.deleteItemInCart(productId);
    return either.fold(
            (l){
          return Left(BaseError(errorMessage: l.errorMessage));
        },
            (response){
          return Right(response);
        });
  }

  @override
  Future<Either<BaseError, GetCartResponseEntity>>
  updateCountInCart(String productId, int count)async{
    var either = await apiManager.updateCountInCart(productId,count);
    return either.fold(
            (l){
          return Left(BaseError(errorMessage: l.errorMessage));
        },
            (response){
          return Right(response);
        });
  }
}