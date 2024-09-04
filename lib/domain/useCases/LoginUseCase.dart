import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/baseError..dart';
import '../entities/AuthEntity.dart';
import '../repositoryContract/AuthRepositoryContract.dart';

 class LoginUseCase {
  AuthRepositoryContract authRepositoryContract;
  LoginUseCase({required this.authRepositoryContract});
  Future<Either<BaseError, AuthEntity>> invoke(
      {required String email,required String password}){
    return authRepositoryContract.
    login(email, password);
  }
}
