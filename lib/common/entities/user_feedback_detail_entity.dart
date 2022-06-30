// To parse this JSON data, do
//
//     final userFeedbackDetailEntity = userFeedbackDetailEntityFromJson(jsonString);

import 'dart:convert';

UserFeedbackDetailEntity userFeedbackDetailEntityFromJson(String str) =>
    UserFeedbackDetailEntity.fromJson(json.decode(str));

String userFeedbackDetailEntityToJson(UserFeedbackDetailEntity data) =>
    json.encode(data.toJson());

class UserFeedbackDetailEntity {
  UserFeedbackDetailEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int? code;
  String? message;
  List<Datum>? data;

  factory UserFeedbackDetailEntity.fromJson(Map<String, dynamic> json) =>
      UserFeedbackDetailEntity(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.userFeedbackId,
    this.adminUserId,
    this.adminUserName,
    required this.content,
    this.createdAt,
  });

  int id;
  int userFeedbackId;
  dynamic adminUserId;
  dynamic adminUserName;
  String content;
  dynamic createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userFeedbackId: json["userFeedbackId"],
        adminUserId: json["adminUserId"],
        adminUserName: json["adminUserName"],
        content: json["content"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userFeedbackId": userFeedbackId,
        "adminUserId": adminUserId,
        "adminUserName": adminUserName,
        "content": content,
        "createdAt": createdAt,
      };
}

//UserFeedbackDetailUpdateEntity

UserFeedbackDetailUpdateEntity userFeedbackDetailUpdateEntityFromJson(
        String str) =>
    UserFeedbackDetailUpdateEntity.fromJson(json.decode(str));

String userFeedbackDetailUpdateEntityToJson(
        UserFeedbackDetailUpdateEntity data) =>
    json.encode(data.toJson());

class UserFeedbackDetailUpdateEntity {
  UserFeedbackDetailUpdateEntity({
    required this.userFeedbackId,
    required this.content,
  });

  int userFeedbackId;
  String content;

  factory UserFeedbackDetailUpdateEntity.fromJson(Map<String, dynamic> json) =>
      UserFeedbackDetailUpdateEntity(
        userFeedbackId: json["userFeedbackId"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "userFeedbackId": userFeedbackId,
        "content": content,
      };
}
