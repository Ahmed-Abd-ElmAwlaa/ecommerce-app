import 'package:ecommerce/domain/entities/GetCartResponseEntity.dart';

import '../../../../data/api/baseError..dart';

abstract class CartScreenStates{}
class CartScreenInitialState extends CartScreenStates{}

class CartScreenLoadingStates extends CartScreenStates{
  String loadingMessage;
  CartScreenLoadingStates({required this.loadingMessage});
}

class CartScreenErrorStates extends CartScreenStates{
  BaseError errorMessage;
  CartScreenErrorStates({required this.errorMessage});
}

class CartScreenSuccessStates extends CartScreenStates{
  GetCartResponseEntity getCartResponseEntity;
  CartScreenSuccessStates({required this.getCartResponseEntity});
}

class DeleteItemInCartScreenLoadingStates extends CartScreenStates{
  String loadingMessage;
  DeleteItemInCartScreenLoadingStates({required this.loadingMessage});
}

class DeleteItemInCartScreenErrorStates extends CartScreenStates{
  BaseError errorMessage;
  DeleteItemInCartScreenErrorStates({required this.errorMessage});
}

class DeleteItemInCartScreenSuccessStates extends CartScreenStates{
  GetCartResponseEntity getCartResponseEntity;
  DeleteItemInCartScreenSuccessStates({required this.getCartResponseEntity});
}

class UpdateCountInCartScreenLoadingStates extends CartScreenStates{
  String loadingMessage;
  UpdateCountInCartScreenLoadingStates({required this.loadingMessage});
}

class UpdateCountInCartScreenErrorStates extends CartScreenStates{
  BaseError errorMessage;
  UpdateCountInCartScreenErrorStates({required this.errorMessage});
}

class UpdateCountInCartScreenSuccessStates extends CartScreenStates{
  GetCartResponseEntity getCartResponseEntity;
  UpdateCountInCartScreenSuccessStates({required this.getCartResponseEntity});
}
