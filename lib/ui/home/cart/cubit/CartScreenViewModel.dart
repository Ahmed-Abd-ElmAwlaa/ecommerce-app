import 'package:ecommerce/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce/ui/home/cart/cubit/CartScreenStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/useCases/DeleteItemInCartUseCase.dart';
import '../../../../domain/useCases/GetCartUseCase.dart';
import '../../../../domain/useCases/UpdateCountInCartUseCase.dart';

class CartScreenViewModel extends Cubit<CartScreenStates>{
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  UpdateCountInCartUseCase updateCountInCartUseCase;
  CartScreenViewModel({required this.getCartUseCase,
    required this.deleteItemInCartUseCase,
    required this.updateCountInCartUseCase}):
        super(CartScreenInitialState());
  List<GetProductEntity>productList=[];
  static CartScreenViewModel get(context)=>BlocProvider.of(context);
  void getCart()async{
    emit(CartScreenLoadingStates(loadingMessage:
    "loading..."));
    var either = await getCartUseCase.invoke();
    either.fold(
          (error) {
        emit(CartScreenErrorStates(errorMessage: error));
      }, (response){
            productList=response.data?.products??[];
      emit(CartScreenSuccessStates
        (getCartResponseEntity:response ));
    },
    );
  }

  void deleteItemInCart(String productId)async{
    emit(DeleteItemInCartScreenLoadingStates(loadingMessage:
    "loading..."));
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold(
          (error) {
        emit(DeleteItemInCartScreenErrorStates(errorMessage: error));
      }, (response){
            productList=response.data?.products??[];
      emit(CartScreenSuccessStates
        (getCartResponseEntity:response ));
    },
    );
  }

  void updateCountInCart(String productId,int count)async{
    emit(UpdateCountInCartScreenLoadingStates(loadingMessage:
    "loading..."));
    var either = await updateCountInCartUseCase.invoke(productId,count);
    either.fold(
          (error) {
        emit(UpdateCountInCartScreenErrorStates(errorMessage: error));
      }, (response){
            productList=response.data?.products??[];
      emit(CartScreenSuccessStates
        (getCartResponseEntity:response ));
    },
    );
  }

}