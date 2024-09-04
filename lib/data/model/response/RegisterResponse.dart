
import '../../../domain/entities/AuthEntity.dart';
import 'UserDto.dart';
import 'Error.dart';

/// message : "success"
/// user : {"name":"Ahmed El-Mawla","email":"hooh3415@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YTAzM2MzZWQwZGMwMDE2Y2M3ZGRhOSIsIm5hbWUiOiJBaG1lZCBFbC1NYXdsYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzIxNzc1MDQ0LCJleHAiOjE3Mjk1NTEwNDR9.Rqt2EPUASJVpsnYRvB4OUJpedZ2-1Jm8Nb_4M_Ef-IA"

class RegisterResponse {
  RegisterResponse({
      this.message, 
      this.user, 
      this.token,
  this.error,
  this.statusMsg});

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  Error? error;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
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