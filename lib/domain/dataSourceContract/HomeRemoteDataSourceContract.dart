import 'package:dartz/dartz.dart';

import '../../data/api/baseError..dart';
import '../entities/AddToCartResponseEntity.dart';
import '../entities/CategoryOrBrandResponseEntity.dart';
import '../entities/ProductResponseEntity.dart';

abstract class HomeRemoteDataSourceContract{
  Future<Either<BaseError, CategoryOrBrandResponseEntity> >
  getCategories();
  Future<Either<BaseError, CategoryOrBrandResponseEntity> >
  getBrands();
  Future<Either<BaseError, ProductResponseEntity> >
  getProducts();
  Future<Either<BaseError, AddToCartResponseEntity> >
  addToCart(String productId);

}