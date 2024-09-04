import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/baseError..dart';
import 'package:ecommerce/domain/repositoryContract/AuthRepositoryContract.dart';
import '../../domain/dataSourceContract/AuthRemoteDataSourceContract.dart';
import '../../domain/entities/AuthEntity.dart';

class AuthRepositoryImp implements AuthRepositoryContract {
  AuthRemoteDataSourceContract remoteDataSource;
  AuthRepositoryImp({required this.remoteDataSource});
  @override
  Future<Either<BaseError, AuthEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return remoteDataSource.
    register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<BaseError, AuthEntity>>
  login(String email, String password) {
    return remoteDataSource.
    login(email, password);
  }
}
