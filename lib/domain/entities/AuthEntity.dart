import 'package:ecommerce/domain/entities/UserEntity.dart';

class AuthEntity{
   UserEntity? userEntity;
  String? token;
  AuthEntity({this.userEntity, this.token});
}