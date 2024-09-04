import 'package:ecommerce/data/di.dart';
import 'package:ecommerce/ui/auth/register/cubit/RegisterScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/dialog_utils.dart';
import '../../utils/my_colors.dart';
import '../../utils/text_field_item.dart';
import 'cubit/RegisterStates.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel registerScreenViewModel=
  RegisterScreenViewModel(registerUseCase:
  injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel,RegisterState>
      (bloc: registerScreenViewModel,
      listener: (context, state) {
        if(state is RegisterLoadingState){
          DialogUtils.showLoading(context,
              state.loadingMessage??"loading..");
        }
        else if(state is RegisterErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context,
              state.errorMessage??"Error",
          title: "error",posActionName: "Ok");
        }
        else if(state is RegisterSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context,
              state.response.userEntity?.name??"name"
          ,title: "Success",posActionName: "OK");
        }
      },
    child:   Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                child: Image.asset(
                  'assets/images/Route.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Form(
                        key: registerScreenViewModel.formKey,
                        child: Column(
                          children: [
                            TextFieldItem(
                              fieldName: 'Full Name',
                              hintText: 'enter your name',
                              controller: registerScreenViewModel.nameController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your name';
                                }
                                return null;
                              },
                            ),
                            TextFieldItem(
                              fieldName: 'E-mail address',
                              hintText: 'enter your email address',
                              controller: registerScreenViewModel.emailController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your email address';
                                }
                                bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid) {
                                  return 'invalid email';
                                }
                                return null;
                              },
                            ),
                            TextFieldItem(
                              fieldName: 'Password',
                              hintText: 'enter your password',
                              controller: registerScreenViewModel.passwordController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter password';
                                }
                                if (value.trim().length < 6 ||
                                    value.trim().length > 30) {
                                  return 'password should be >6 & <30';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              isObscure: registerScreenViewModel.isObscure,
                              suffixIcon: InkWell(
                                child: registerScreenViewModel.isObscure
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onTap: () {
                                  if (registerScreenViewModel.isObscure) {
                                    registerScreenViewModel.isObscure = false;
                                  } else {
                                    registerScreenViewModel.isObscure = true;
                                  }
                                  setState(() {});
                                },
                              ),
                            ),
                            TextFieldItem(
                              fieldName: 'Confirmation Password',
                              hintText: 'enter your confirmationPassword',
                              controller: registerScreenViewModel.confirmationPasswordController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter rePassword';
                                }
                                if (value != registerScreenViewModel.passwordController.text) {
                                  return "Password doesn't match";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              isObscure: registerScreenViewModel.isObscure,
                              suffixIcon: InkWell(
                                child: registerScreenViewModel.isObscure
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onTap: () {
                                  if (registerScreenViewModel.isObscure) {
                                    registerScreenViewModel.isObscure = false;
                                  } else {
                                    registerScreenViewModel.isObscure = true;
                                  }
                                  setState(() {});
                                },
                              ),
                            ),
                            TextFieldItem(
                              fieldName: 'Mobile Number',
                              hintText: 'enter your mobile no',
                              controller: registerScreenViewModel.phoneController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your mobile no';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35.h),
                      child: ElevatedButton(
                        onPressed: () {
                          registerScreenViewModel.register();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.whiteColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.r)))),
                        child: SizedBox(
                          height: 64.h,
                          width: 398.w,
                          child: Center(
                            child: Text(
                              'Sign up',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 20.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );

  }
}
