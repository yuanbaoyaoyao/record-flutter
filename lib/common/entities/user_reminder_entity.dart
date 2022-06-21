// To parse this JSON data, do
//
//     final userReminderEntity = userReminderEntityFromJson(jsonString);

import 'dart:convert';

UserReminderEntity userReminderEntityFromJson(String str) =>
    UserReminderEntity.fromJson(json.decode(str));

String userReminderEntityToJson(UserReminderEntity data) =>
    json.encode(data.toJson());

class UserReminderEntity {
  UserReminderEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory UserReminderEntity.fromJson(Map<String, dynamic> json) =>
      UserReminderEntity(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.userFeedbackId,
    this.orderProductId,
    required this.feedbackTitle,
    this.orderSn,
    required this.isRead,
    required this.createdAt,
  });

  int id;
  int userId;
  int userFeedbackId;
  dynamic orderProductId;
  String feedbackTitle;
  dynamic orderSn;
  bool isRead;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        userFeedbackId: json["userFeedbackId"],
        orderProductId: json["orderProductId"],
        feedbackTitle: json["feedbackTitle"],
        orderSn: json["orderSn"],
        isRead: json["isRead"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "userFeedbackId": userFeedbackId,
        "orderProductId": orderProductId,
        "feedbackTitle": feedbackTitle,
        "orderSn": orderSn,
        "isRead": isRead,
        "createdAt": createdAt.toIso8601String(),
      };
}
