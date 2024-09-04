import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/apiManager.dart';
import 'package:ecommerce/data/api/baseError..dart';
import '../../domain/dataSourceContract/AuthRemoteDataSourceContract.dart';
import '../../domain/entities/AuthEntity.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSourceContract{
  ApiManager apiManager;
  AuthRemoteDataSourceImp({required this.apiManager});
  @override
  Future<Either<BaseError, AuthEntity>>
  register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone,
      )
  async{
    var either = await apiManager.register(
        name,
        email,
        password,
        rePassword,
        phone);
    return
      either.fold((error){
      return Left(BaseError(errorMessage: error.errorMessage));
    }
        , (response) {
      return Right(response.toAuthEntity());
        });
  }

  @override
  Future<Either<BaseError, AuthEntity>>
  login(String email, String password) async{
    var either = await apiManager.login(email,password);
    return either.fold((error){
        return Left(BaseError(errorMessage: error.errorMessage));
      }
          , (response) {
            return Right(response.toAuthEntity());
          });
  }

}