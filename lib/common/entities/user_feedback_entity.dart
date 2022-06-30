// To parse this JSON data, do
//
//     final userFeedbackEntity = userFeedbackEntityFromJson(jsonString);

import 'dart:convert';

UserFeedbackEntity userFeedbackEntityFromJson(String str) =>
    UserFeedbackEntity.fromJson(json.decode(str));

String userFeedbackEntityToJson(UserFeedbackEntity data) =>
    json.encode(data.toJson());

class UserFeedbackEntity {
  UserFeedbackEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  Data data;

  factory UserFeedbackEntity.fromJson(Map<String, dynamic> json) =>
      UserFeedbackEntity(
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
    required this.records,
    required this.total,
    required this.size,
    required this.current,
    required this.orders,
    required this.optimizeCountSql,
    required this.searchCount,
    this.countId,
    this.maxLimit,
    required this.pages,
  });

  List<Record> records;
  int total;
  int size;
  int current;
  List<dynamic> orders;
  bool optimizeCountSql;
  bool searchCount;
  dynamic countId;
  dynamic maxLimit;
  int pages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
        total: json["total"],
        size: json["size"],
        current: json["current"],
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        optimizeCountSql: json["optimizeCountSql"],
        searchCount: json["searchCount"],
        countId: json["countId"],
        maxLimit: json["maxLimit"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "total": total,
        "size": size,
        "current": current,
        "orders": List<dynamic>.from(orders.map((x) => x)),
        "optimizeCountSql": optimizeCountSql,
        "searchCount": searchCount,
        "countId": countId,
        "maxLimit": maxLimit,
        "pages": pages,
      };
}

class Record {
  Record({
    required this.id,
    required this.userId,
    required this.username,
    required this.feedbackTitle,
    required this.feedbackPicUrl,
    required this.feedbackContent,
    required this.isRead,
    required this.isFinished,
    required this.createdAt,
  });

  int id;
  int userId;
  String username;
  String feedbackTitle;
  String feedbackPicUrl;
  String feedbackContent;
  bool isRead;
  bool isFinished;
  DateTime createdAt;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["id"],
        userId: json["userId"],
        username: json["username"],
        feedbackTitle: json["feedbackTitle"],
        feedbackPicUrl: json["feedbackPicUrl"],
        feedbackContent: json["feedbackContent"],
        isRead: json["isRead"],
        isFinished: json["isFinished"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "username": username,
        "feedbackTitle": feedbackTitle,
        "feedbackPicUrl": feedbackPicUrl,
        "feedbackContent": feedbackContent,
        "isRead": isRead,
        "isFinished": isFinished,
        "createdAt": createdAt.toIso8601String(),
      };
}

//UserFeedbackDetailUpdateEntity

UserFeedbackUpdateEntity userFeedbackUpdateEntityFromJson(String str) =>
    UserFeedbackUpdateEntity.fromJson(json.decode(str));

String userFeedbackUpdateEntityToJson(UserFeedbackUpdateEntity data) =>
    json.encode(data.toJson());

class UserFeedbackUpdateEntity {
  UserFeedbackUpdateEntity({
    required this.id,
  });

  int id;

  factory UserFeedbackUpdateEntity.fromJson(Map<String, dynamic> json) =>
      UserFeedbackUpdateEntity(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
