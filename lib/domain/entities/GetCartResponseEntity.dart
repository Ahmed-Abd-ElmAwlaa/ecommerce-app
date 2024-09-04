import 'package:ecommerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';

class GetCartResponseEntity{
  GetCartResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.data,});

  String? status;
  num? numOfCartItems;
  GetDataEntity? data;

}

class GetDataEntity {
  GetDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<GetProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

}

class GetProductEntity {
  GetProductEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  num? count;
  String? id;
  GetProductDataEntity? product;
  num? price;
}

class GetProductDataEntity {
  GetProductDataEntity({
      this.subcategory, 
      this.id, 
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage,});

  List<SubcategoryEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;

}
