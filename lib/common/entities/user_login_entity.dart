// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';
//userLogin

UserLoginEntity userLoginEntityFromJson(String str) =>
    UserLoginEntity.fromJson(json.decode(str));

String userLoginEntityToJson(UserLoginEntity data) =>
    json.encode(data.toJson());

class UserLoginEntity {
  UserLoginEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  Data data;

  factory UserLoginEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginEntity(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.userInfo,
    required this.token,
  });

  UserInfo userInfo;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userInfo: UserInfo.fromJson(json["userInfo"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userInfo": userInfo.toJson(),
        "token": token,
      };
}

class UserInfo {
  UserInfo({
    required this.nickName,
    this.avatar,
    required this.userId,
  });

  String nickName;
  dynamic avatar;
  int userId;

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

UserLoginInputEntity userLoginInputEntityFromJson(String str) => UserLoginInputEntity.fromJson(json.decode(str));

String userLoginInputEntityToJson(UserLoginInputEntity data) => json.encode(data.toJson());

class UserLoginInputEntity {
  UserLoginInputEntity({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory UserLoginInputEntity.fromJson(Map<String, dynamic> json) => UserLoginInputEntity(
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}