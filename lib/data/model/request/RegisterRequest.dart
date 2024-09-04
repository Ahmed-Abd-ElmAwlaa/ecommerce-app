/// name : "Ahmed El-Mawla"
/// email : "hooh3415@gmail.com"
/// password : "AhmedElmawla@123"
/// rePassword : "AhmedElmawla@123"
/// phone : "01116867072"

class RegisterRequest {
  RegisterRequest({
      this.name, 
      this.email, 
      this.password, 
      this.rePassword, 
      this.phone,});

  RegisterRequest.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
    phone = json['phone'];
  }

  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phone'] = phone;
    return map;
  }

}