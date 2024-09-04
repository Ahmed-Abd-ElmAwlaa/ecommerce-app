import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/useCases/AddToCartUseCase.dart';
import '../../../../../domain/useCases/ProductsUseCase.dart';
import 'ProductTabStates.dart';

class ProductTabViewModel extends Cubit<ProductTabStates>{

  GetProductsUseCase getProductsUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductTabViewModel({required this.getProductsUseCase,
    required this.addToCartUseCase}):
        super(HomeTabProductInitialStates());
  int numOfCartItem=0;
  static ProductTabViewModel get(context)=>BlocProvider
      .of(context);
  List<ProductEntity>productsList=[];
  void getProducts()async{
    emit(HomeTabProductLoadingStates(loadingMessage:
    "loading..."));
    var either = await getProductsUseCase.invoke();
    either.fold(
            (error) {
      emit(HomeTabProductErrorStates(errorMessage: error));

    }, (response){
      productsList=response.data??[];
      emit(HomeTabProductSuccessStates(productResponseEntity:
      response));
    },
    );
  }

  void addToCart(String productId)async{
    emit(AddToCartLoadingStates(loadingMessage:
    "loading..."));
    var either = await addToCartUseCase.invoke(productId);
    either.fold(
            (error) {
      emit(AddToCartErrorStates(errorMessage: error));
    }, (response){
      numOfCartItem=response.numOfCartItems??0;
      emit(AddToCartSuccessStates(
          addToCartResponseEntity: response));
    },
    );
  }

}