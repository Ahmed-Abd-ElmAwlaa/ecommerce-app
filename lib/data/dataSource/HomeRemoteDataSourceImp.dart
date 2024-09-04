import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/apiManager.dart';
import 'package:ecommerce/data/api/baseError..dart';
import 'package:ecommerce/domain/dataSourceContract/HomeRemoteDataSourceContract.dart';
import 'package:ecommerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:ecommerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';

class HomeRemoteDataSourceImp implements
    HomeRemoteDataSourceContract{
  ApiManager apiManager;
  HomeRemoteDataSourceImp({required this.apiManager});
  @override
  Future<Either<BaseError, CategoryOrBrandResponseEntity>>
  getCategories() async{
    var either = await apiManager.getCategories();
    return either.fold(
            (l){
      return Left(BaseError(errorMessage: l.errorMessage));
    },
            (response){
      return Right(response);
    });
  }

  @override
  Future<Either<BaseError, CategoryOrBrandResponseEntity>>
  getBrands()async {
    var either = await apiManager.getBrands();
    return either.fold(
            (l){
          return Left(BaseError(errorMessage: l.errorMessage));
        },
            (response){
          return Right(response);
        });
  }

  @override
  Future<Either<BaseError, ProductResponseEntity>>
  getProducts()async {
    var either = await apiManager.getProducts();
    return either.fold(
            (l){
          return Left(BaseError(errorMessage: l.errorMessage));
        },
            (response){
          return Right(response);
        });
  }

  @override
  Future<Either<BaseError, AddToCartResponseEntity>>
  addToCart(String productId)async {
    var either = await apiManager.addToCart(productId);
    return either.fold(
            (l){
          return Left(BaseError(errorMessage: l.errorMessage));
        },
            (response){
          return Right(response);
        });
  }

}