import 'package:ecommerce/domain/entities/UserEntity.dart';

/// name : "Ahmed El-Mawla"
/// email : "hooh3415@gmail.com"
/// role : "user"

class UserDto {
  UserDto({
      this.name, 
      this.email,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
  }
  String? name;
  String? email;
UserDto copyWith({  String? name,
  String? email,
  String? role,
}) => UserDto(  name: name ?? this.name,
  email: email ?? this.email,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    return map;
  }

  UserEntity userEntity(){
    return UserEntity(
      email: email,
      name: name
    );
  }
}