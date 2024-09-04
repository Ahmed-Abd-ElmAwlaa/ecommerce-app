import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:ecommerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';

import '../../data/api/baseError..dart';

abstract class HomeRepositoryContract{
  Future<Either<BaseError, CategoryOrBrandResponseEntity> >
  getCategories();
  Future<Either<BaseError, CategoryOrBrandResponseEntity> >
  getBrands();
  Future<Either<BaseError, ProductResponseEntity> >
  getProducts();
  Future<Either<BaseError, AddToCartResponseEntity> >
  addToCart(String productId);
}