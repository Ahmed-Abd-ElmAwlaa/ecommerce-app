import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/apiConstants.dart';
import 'package:ecommerce/data/model/request/RegisterRequest.dart';
import 'package:ecommerce/data/model/response/AddToCartResponseDto.dart';
import 'package:ecommerce/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:ecommerce/data/model/response/ProductResponseDto.dart';
import 'package:ecommerce/data/model/response/RegisterResponse.dart';
import 'package:ecommerce/domain/entities/GetCartResponseEntity.dart';
import 'package:http/http.dart' as http;
import '../../ui/utils/shared_preference_utils.dart';
import '../model/request/LoginRequest.dart';
import '../model/response/GetCartResponseDto.dart';
import '../model/response/LoginResponse.dart';
import 'baseError..dart';

class ApiManager{
  ApiManager._(); // private constructor
  static ApiManager? _instance;
  static ApiManager getInstance(){
    _instance  ??= ApiManager._();
    return _instance!;
  }


  Future<Either<BaseError, RegisterResponse>>
  register (
      String name,
      String email,
      String password,
      String rePassword,
      String phone
      )async{

    final connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var url = Uri.https(ApiConstants.baseUrl,
          ApiConstants.apiRegister);
      var requestBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        phone: phone,
        rePassword: rePassword,
      );
      var response= await http.post(url,body: requestBody.toJson());
      var registerResponse= RegisterResponse.
      fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode<300){
        return Right(registerResponse);
      }
      else{
        return Left(BaseError(
          errorMessage:registerResponse.error!=null?
              registerResponse.error!.msg!
              :registerResponse.message
        ));
      }
    } else{
      return Left(BaseError(errorMessage: "Check internet connection"));
    }


  }
  Future<Either<BaseError, LoginResponse>>
  login (
      String email,
      String password,
      )async{

    final connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var url = Uri.https(ApiConstants.baseUrl,
          ApiConstants.apiLogin);
      var requestBody = LoginRequest(
        email: email,
        password: password,
      );
      var response= await http.post(url,body: requestBody.toJson());
      var loginResponse=LoginResponse.
      fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode<300){
        SharedPreferenceUtils.saveData(key: "Token",
            value:loginResponse.token);
        return Right(loginResponse);
      }
      else{
        return Left(BaseError(
          errorMessage:loginResponse.message)
          ,);
      }
    } else{
      return Left(BaseError(errorMessage: "Check internet connection"));
    }


  }

  Future<Either<BaseError, CategoryOrBrandResponseDto>>
  getCategories ()async{

    final connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var url = Uri.https(ApiConstants.baseUrl,
          ApiConstants.getCategories);
      var response= await http.get(url);
      var categoryResponse= CategoryOrBrandResponseDto.
      fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode<300){
        return Right(categoryResponse);
      }
      else{
        return Left(ServerError(
          errorMessage:categoryResponse.message)
        );
      }
    }
    else{
      return Left(NetworkError(errorMessage: "Check internet connection"));
    }
  }


  Future<Either<BaseError, CategoryOrBrandResponseDto>>
  getBrands ()async{

    final connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var url = Uri.https(ApiConstants.baseUrl,
          ApiConstants.getBrands);
      var response= await http.get(url);
      var categoryOrBrandResponse= CategoryOrBrandResponseDto.
      fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode<300){
        return Right(categoryOrBrandResponse);
      }
      else{
        return Left(ServerError(
          errorMessage:categoryOrBrandResponse.message)
        );
      }
    }
    else{
      return Left(NetworkError(errorMessage: "Check internet connection"));
    }
  }


  Future<Either<BaseError, ProductResponseDto>>
  getProducts ()async{

    final connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var url = Uri.https(ApiConstants.baseUrl,
          ApiConstants.getProducts);
      var response= await http.get(url);
      var productResponse= ProductResponseDto.
      fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode<300){
        return Right(productResponse);
      }
      else{
        return Left(ServerError(
            errorMessage:productResponse.message)
        );
      }
    }
    else{
      return Left(NetworkError(errorMessage:
      "Check internet connection"));
    }
  }

  Future<Either<BaseError, AddToCartResponseDto>>
  addToCart (String productId)async{

    final connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var url = Uri.https(ApiConstants.baseUrl,
          ApiConstants.addToCart);
      var token = SharedPreferenceUtils.getData(key: "Token") ;
      var response= await http.post(url,body:
      {"productId":productId},headers: {"token":token.toString()});
      var addToCartResponse= AddToCartResponseDto.
      fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode<300){
        return Right(addToCartResponse);
      }else if(response.statusCode == 401){
        return Left(ServerError(errorMessage:addToCartResponse.message),);
      }
      else{
        return Left(ServerError(errorMessage:addToCartResponse.message)
        );
      }
    }
    else{
      return Left(NetworkError(errorMessage:
      "Check internet connection"));
    }
  }
  

  Future<Either<BaseError, GetCartResponseDto>>
  getCart ()async{

    final connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var url = Uri.https(ApiConstants.baseUrl,
          ApiConstants.addToCart);
      var token = SharedPreferenceUtils.getData(key: "Token") ;
      var response= await http.get(url,
          headers: {"token":token.toString()});
      var getCartResponse= GetCartResponseDto.
      fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode<300){
        return Right(getCartResponse);
      }else if(response.statusCode == 401){
        return Left(ServerError(errorMessage:getCartResponse.message),);
      }
      else{
        return Left(ServerError(errorMessage:getCartResponse.message)
        );
      }
    }
    else{
      return Left(NetworkError(errorMessage:
      "Check internet connection"));
    }
  } 
  
  
  Future<Either<BaseError, GetCartResponseDto>>
  deleteItemInCart (String productId)async{
    final connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var url = Uri.https(ApiConstants.baseUrl,
          "${ApiConstants.addToCart}/$productId");
      var token = SharedPreferenceUtils.getData(key: "Token") ;
      var response= await http.delete(url,
          headers: {"token":token.toString()});
      var deleteItemInCartResponse= GetCartResponseDto.
      fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode<300){
        return Right(deleteItemInCartResponse);
      }else if(response.statusCode == 401){
        return Left(ServerError(errorMessage:deleteItemInCartResponse.message),);
      }
      else{
        return Left(ServerError(errorMessage:deleteItemInCartResponse.message)
        );
      }
    }
    else{
      return Left(NetworkError(errorMessage:
      "Check internet connection"));
    }
  }

  Future<Either<BaseError, GetCartResponseDto>>
  updateCountInCart (String productId, int couont)async{
    final connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var url = Uri.https(ApiConstants.baseUrl,
          "${ApiConstants.addToCart}/$productId");
      var token = SharedPreferenceUtils.getData(key: "Token") ;
      var response= await http.put(url,
          body: {
        "count":"$couont"
          },
          headers: {"token":token.toString()});
      var updateCountInCartResponse= GetCartResponseDto.
      fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode<300){
        return Right(updateCountInCartResponse);
      }else if(response.statusCode == 401){
        return Left(ServerError(errorMessage:updateCountInCartResponse.message),);
      }
      else{
        return Left(ServerError(errorMessage:updateCountInCartResponse.message)
        );
      }
    }
    else{
      return Left(NetworkError(errorMessage:
      "Check internet connection"));
    }
  }

}