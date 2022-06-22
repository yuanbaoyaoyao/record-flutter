// To parse this JSON data, do
//
//     final userCollectEntity = userCollectEntityFromJson(jsonString);

import 'dart:convert';

UserCollectEntity userCollectEntityFromJson(String str) =>
    UserCollectEntity.fromJson(json.decode(str));

String userCollectEntityToJson(UserCollectEntity data) =>
    json.encode(data.toJson());

class UserCollectEntity {
  UserCollectEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  Data data;

  factory UserCollectEntity.fromJson(Map<String, dynamic> json) =>
      UserCollectEntity(
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
    this.userId,
    required this.productSkusId,
    this.createdAt,
  });

  int id;
  dynamic userId;
  int productSkusId;
  dynamic createdAt;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["id"],
        userId: json["userId"],
        productSkusId: json["productSkusId"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "productSkusId": productSkusId,
        "createdAt": createdAt,
      };
}