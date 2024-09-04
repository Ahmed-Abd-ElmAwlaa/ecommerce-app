import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/baseError..dart';
import '../entities/AuthEntity.dart';
import '../repositoryContract/AuthRepositoryContract.dart';

 class RegisterUseCase {
  AuthRepositoryContract authRepositoryContract;
  RegisterUseCase({required this.authRepositoryContract});
  Future<Either<BaseError, AuthEntity>> invoke(String name,
      String email, String password, String rePassword, String phone){
    return authRepositoryContract.
    register(name, email, password, rePassword, phone);
  }
}
