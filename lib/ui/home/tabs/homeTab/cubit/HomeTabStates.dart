import 'package:ecommerce/data/api/baseError..dart';
import 'package:ecommerce/domain/entities/CategoryOrBrandResponseEntity.dart';

abstract class HomeTabStates{}

class HomeTabCategoryInitialStates extends HomeTabStates{}
class HomeTabCategoryLoadingStates extends HomeTabStates{
  String loadingMessage;
  HomeTabCategoryLoadingStates({required this.loadingMessage});
}
class HomeTabCategoryErrorStates extends HomeTabStates{
  BaseError errorMessage;
  HomeTabCategoryErrorStates({required this.errorMessage});
}
class HomeTabCategorySuccessStates extends HomeTabStates{
  CategoryOrBrandResponseEntity categoryResponseEntity;
  HomeTabCategorySuccessStates({required this.categoryResponseEntity});
}

class HomeTabBrandInitialStates extends HomeTabStates{}
class HomeTabBrandLoadingStates extends HomeTabStates{
  String loadingMessage;
  HomeTabBrandLoadingStates({required this.loadingMessage});
}
class HomeTabBrandErrorStates extends HomeTabStates{
  BaseError errorMessage;
  HomeTabBrandErrorStates({required this.errorMessage});
}
class HomeTabBrandSuccessStates extends HomeTabStates{
  CategoryOrBrandResponseEntity brandResponseEntity;
  HomeTabBrandSuccessStates({required this.brandResponseEntity});
}