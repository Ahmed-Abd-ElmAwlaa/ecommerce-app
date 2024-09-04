import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/baseError..dart';
import 'package:ecommerce/domain/dataSourceContract/HomeRemoteDataSourceContract.dart';
import 'package:ecommerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:ecommerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce/domain/repositoryContract/HomeRepositoryContract.dart';

class HomeRepositoryImp implements HomeRepositoryContract{
  HomeRemoteDataSourceContract homeRemoteDataSource;
  HomeRepositoryImp({required this.homeRemoteDataSource});

  @override
  Future<Either<BaseError, CategoryOrBrandResponseEntity>>
  getCategories() {
    return homeRemoteDataSource.getCategories();
  }

  @override
  Future<Either<BaseError, CategoryOrBrandResponseEntity>>
  getBrands() {
    return homeRemoteDataSource.getBrands();

  }

  @override
  Future<Either<BaseError, ProductResponseEntity>>
  getProducts() {
    return homeRemoteDataSource.getProducts();

  }

  @override
  Future<Either<BaseError, AddToCartResponseEntity>>
  addToCart(String productId) {
   return homeRemoteDataSource.addToCart(productId);
  }

}