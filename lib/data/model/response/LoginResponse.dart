import 'package:ecommerce/data/model/response/UserDto.dart';

import '../../../domain/entities/AuthEntity.dart';

class LoginResponse {
  LoginResponse({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthEntity toAuthEntity(){
    return AuthEntity(
        token: token,
        userEntity:user?.userEntity()
    );
  }

}
