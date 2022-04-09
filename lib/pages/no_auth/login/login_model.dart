// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  UserLogin({
    this.token,
    this.name,
    this.id,
  });

  String? token;
  String? name;
  String? id;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
    token: json["token"],
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "name": name,
    "id": id,
  };
}
