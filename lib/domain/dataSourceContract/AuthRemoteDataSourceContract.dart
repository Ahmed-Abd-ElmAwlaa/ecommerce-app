
import 'package:dartz/dartz.dart';
import '../../data/api/baseError..dart';
import '../entities/AuthEntity.dart';

abstract class AuthRemoteDataSourceContract {
  Future<Either<BaseError, AuthEntity>> register(String name,
      String email, String password,
      String rePassword, String phone);

  Future<Either<BaseError, AuthEntity>> login(
      String email, String password,);
}