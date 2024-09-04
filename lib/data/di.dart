import 'package:ecommerce/data/api/apiManager.dart';
import 'package:ecommerce/data/dataSource/HomeRemoteDataSourceImp.dart';
import 'package:ecommerce/data/repository/AuthRepositoryImp.dart';
import 'package:ecommerce/data/repository/CartRepositoryImp.dart';
import 'package:ecommerce/data/repository/HomeRepositoryImp.dart';
import 'package:ecommerce/domain/dataSourceContract/HomeRemoteDataSourceContract.dart';
import 'package:ecommerce/domain/repositoryContract/HomeRepositoryContract.dart';
import 'package:ecommerce/domain/useCases/AddToCartUseCase.dart';
import 'package:ecommerce/domain/useCases/CategoriesUseCase.dart';
import 'package:ecommerce/domain/useCases/ProductsUseCase.dart';
import 'package:ecommerce/domain/useCases/RegisterUseCase.dart';
import '../domain/dataSourceContract/AuthRemoteDataSourceContract.dart';
import '../domain/dataSourceContract/CartRemoteDataSourceContract.dart';
import '../domain/repositoryContract/AuthRepositoryContract.dart';
import '../domain/repositoryContract/CartRepositoryContract.dart';
import '../domain/useCases/BrandsUseCase.dart';
import '../domain/useCases/DeleteItemInCartUseCase.dart';
import '../domain/useCases/GetCartUseCase.dart';
import '../domain/useCases/LoginUseCase.dart';
import '../domain/useCases/UpdateCountInCartUseCase.dart';
import 'dataSource/AuthRemoteDataSourceImp.dart';
import 'dataSource/CartRemoteDataSourceImp.dart';

RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(authRepositoryContract:
  injectAuthRepository());
}

LoginUseCase injectLoginUseCase(){
  return LoginUseCase(authRepositoryContract:
  injectAuthRepository());
}

AuthRepositoryContract injectAuthRepository(){
  return AuthRepositoryImp(remoteDataSource:
  injectAuthRemoteDataSource());
}

AuthRemoteDataSourceContract injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImp(apiManager:
  ApiManager.getInstance());
}


GetCategoriesUseCase injectGetCategoriesUseCase(){
  return GetCategoriesUseCase(homeRepositoryContract:
  injectHomeRepositoryContract());
}
GetBrandsUseCase injectBrandsUseCase(){
  return GetBrandsUseCase(homeRepositoryContract:
  injectHomeRepositoryContract());
}
HomeRepositoryContract injectHomeRepositoryContract(){
  return HomeRepositoryImp(homeRemoteDataSource:
  injectHomeRemoteDataSourceContract() );
}
HomeRemoteDataSourceContract injectHomeRemoteDataSourceContract(){
  return HomeRemoteDataSourceImp(apiManager:
  ApiManager.getInstance());
}


GetProductsUseCase injectGetProductsUseCase(){
  return GetProductsUseCase(homeRepositoryContract:
  injectHomeRepositoryContract());
}

//Cart injection

AddToCartUseCase injectAddToCartUseCase(){
  return AddToCartUseCase(homeRepositoryContract:
  injectHomeRepositoryContract());
}

GetCartUseCase injectGetCartUseCase(){
  return GetCartUseCase(cartRepositoryContract:
  injectCartRepositoryContract());
}
DeleteItemInCartUseCase injectDeleteItemInCartUseCase(){
  return DeleteItemInCartUseCase(cartRepositoryContract:
  injectCartRepositoryContract());
}
UpdateCountInCartUseCase injectUpdateCountInCartUseCase(){
  return UpdateCountInCartUseCase(cartRepositoryContract:
  injectCartRepositoryContract());
}

CartRepositoryContract injectCartRepositoryContract(){
  return CartRepositoryImp(cartRemoteDataSourceContract:injectCartRemoteDataSourceContract());
}

CartRemoteDataSourceContract injectCartRemoteDataSourceContract(){
  return CartRemoteDataSourceImp(apiManager:
  ApiManager.getInstance());
}

