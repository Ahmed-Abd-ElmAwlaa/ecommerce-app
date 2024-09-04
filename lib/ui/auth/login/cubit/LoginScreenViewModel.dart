import 'package:ecommerce/domain/useCases/LoginUseCase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'LoginStates.dart';

class LoginScreenViewModel extends Cubit<LoginState>{
  LoginUseCase loginUseCase;
  LoginScreenViewModel({required this.loginUseCase}):
        super(LoginInitialState());
  // handel logic
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  void login()async{
    if(formKey.currentState?.validate() == true){
      emit(LoginLoadingState(loadingMessage: "Loading..."));
      //register
      var  either = await loginUseCase.
     invoke(email: emailController.text,password: passwordController.text,);
      either.fold((error){
        emit(LoginErrorState(errorMessage: error.errorMessage));
      }
          , (response) {
        emit(LoginSuccessState(response: response));
          });
    }
  }

}