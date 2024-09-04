import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/baseError..dart';
import '../entities/AuthEntity.dart';

abstract class AuthRepositoryContract {
  Future<Either<BaseError, AuthEntity>>
  register(
      String name,
      String email, String password,
      String rePassword, String phone
      );

  Future<Either<BaseError, AuthEntity>>
  login(
      String email, String password
      );
}
