import 'package:dartz/dartz.dart';
import 'package:ecommerce/ui/auth/register/cubit/RegisterStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/useCases/RegisterUseCase.dart';

class RegisterScreenViewModel extends Cubit<RegisterState>{
  RegisterUseCase registerUseCase;
  RegisterScreenViewModel({required this.registerUseCase}):super(RegisterInitialState());
  // handel logic
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObscure = true;
  void register()async{
    if(formKey.currentState?.validate() == true){
      emit(RegisterLoadingState(loadingMessage: "Loading..."));
      //register
      var  either = await registerUseCase.
     invoke(nameController.text,
          emailController.text,
          passwordController.text,
          confirmationPasswordController.text,
          phoneController.text);
      either.fold((error){
        emit(RegisterErrorState(errorMessage: error.errorMessage));
      }
          , (response) {       
        emit(RegisterSuccessState(response: response));
          });
    }
  }

}