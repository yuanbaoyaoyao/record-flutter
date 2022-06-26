// To parse this JSON data, do
//
//     final userInfoEntity = userInfoEntityFromJson(jsonString);

import 'dart:convert';

UserInfoEntity userInfoEntityFromJson(String str) =>
    UserInfoEntity.fromJson(json.decode(str));

String userInfoEntityToJson(UserInfoEntity data) => json.encode(data.toJson());

class UserInfoEntity {
  UserInfoEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  Data data;

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) => UserInfoEntity(
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
    required this.name,
    this.avatar,
    required this.id,
  });

  String name;
  dynamic avatar;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        avatar: json["avatar"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
        "id": id,
      };
}
