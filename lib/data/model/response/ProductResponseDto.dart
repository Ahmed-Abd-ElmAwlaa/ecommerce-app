import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';

import 'CategoryOrBrandResponseDto.dart';

class ProductResponseDto extends ProductResponseEntity {
  ProductResponseDto({
      super.results,
      this.metadata, 
      super.data,});

  ProductResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata = json['metadata'] != null ?
    Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }

  Metadata? metadata;
  String? statusMsg;
  String? message;


}

class ProductDto extends ProductEntity {
  ProductDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
      this.createdAt, 
      this.updatedAt,});

  ProductDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];

    category = json['category'] != null ?
    CategoryOrBrandDto.fromJson(json['category']) : null;

    brand = json['brand'] != null ?
    CategoryOrBrandDto.fromJson(json['brand']) : null;

    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }
  String? createdAt;
  String? updatedAt;
}

// class Brand {
//   Brand({
//       this.id,
//       this.name,
//       this.slug,
//       this.image,});
//
//   Brand.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//
// }
//
// class Category {
//   Category({
//       this.id,
//       this.name,
//       this.slug,
//       this.image,});
//
//   Category.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//
// }

class SubcategoryDto extends SubcategoryEntity {
  SubcategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,});

  SubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit, 
      this.nextPage,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;


}