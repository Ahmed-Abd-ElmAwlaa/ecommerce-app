import 'package:ecommerce/data/api/baseError..dart';
import '../../../../../domain/entities/AddToCartResponseEntity.dart';
import '../../../../../domain/entities/ProductResponseEntity.dart';

abstract class ProductTabStates{}

class HomeTabProductInitialStates extends ProductTabStates{}

class HomeTabProductLoadingStates extends ProductTabStates{
  String loadingMessage;
  HomeTabProductLoadingStates({required this.loadingMessage});
}

class HomeTabProductErrorStates extends ProductTabStates{
  BaseError errorMessage;
  HomeTabProductErrorStates({required this.errorMessage});
}

class HomeTabProductSuccessStates extends ProductTabStates{
  ProductResponseEntity productResponseEntity;
  HomeTabProductSuccessStates({required this.productResponseEntity});
}


class AddToCartLoadingStates extends ProductTabStates{
  String loadingMessage;
  AddToCartLoadingStates({required this.loadingMessage});
}

class AddToCartErrorStates extends ProductTabStates{
  BaseError errorMessage;
  AddToCartErrorStates({required this.errorMessage});
}

class AddToCartSuccessStates extends ProductTabStates{
  AddToCartResponseEntity addToCartResponseEntity;
  AddToCartSuccessStates({required this.addToCartResponseEntity});
}