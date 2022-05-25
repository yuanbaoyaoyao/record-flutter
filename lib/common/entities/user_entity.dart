// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

//UserRegister
UserRegisterEntity userRegisterEntityFromJson(String str) =>
    UserRegisterEntity.fromJson(json.decode(str));

String userRegisterEntityToJson(UserRegisterEntity data) =>
    json.encode(data.toJson());

class UserRegisterEntity {
  UserRegisterEntity({
    required this.name,
    required this.password,
    required this.email,
    required this.emailCode,
  });

  String name;
  String password;
  String email;
  String emailCode;

  factory UserRegisterEntity.fromJson(Map<String, dynamic> json) =>
      UserRegisterEntity(
        name: json["name"],
        password: json["password"],
        email: json["email"],
        emailCode: json["emailCode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "email": email,
        "emailCode": emailCode,
      };
}

//userLogin
UserLoginEntity userLoginEntityFromJson(String str) =>
    UserLoginEntity.fromJson(json.decode(str));

String userLoginEntityToJson(UserLoginEntity data) =>
    json.encode(data.toJson());

class UserLoginEntity {
  UserLoginEntity({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory UserLoginEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginEntity(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

//userInfo
UserInfoEntity userInfoEntityFromJson(String str) =>
    UserInfoEntity.fromJson(json.decode(str));

String userInfoEntityToJson(UserInfoEntity data) => json.encode(data.toJson());

class UserInfoEntity {
  UserInfoEntity({
    this.userInfo,
    this.token,
  });

  UserInfo? userInfo;
  String? token;

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) => UserInfoEntity(
        userInfo: UserInfo.fromJson(json["userInfo"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userInfo": userInfo?.toJson(),
        "token": token,
      };
}

class UserInfo {
  UserInfo({
    this.nickName,
    this.avatar,
    this.userId,
  });

  String? nickName;
  dynamic avatar;
  int? userId;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        nickName: json["nickName"],
        avatar: json["avatar"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "nickName": nickName,
        "avatar": avatar,
        "userId": userId,
      };
}
