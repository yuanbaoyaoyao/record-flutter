// To parse this JSON data, do
//
//     final productSkusEvaluationEntity = productSkusEvaluationEntityFromJson(jsonString);

import 'dart:convert';

ProductSkusEvaluationEntity productSkusEvaluationEntityFromJson(String str) => ProductSkusEvaluationEntity.fromJson(json.decode(str));

String productSkusEvaluationEntityToJson(ProductSkusEvaluationEntity data) => json.encode(data.toJson());

class ProductSkusEvaluationEntity {
  ProductSkusEvaluationEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  Data data;

  factory ProductSkusEvaluationEntity.fromJson(Map<String, dynamic> json) => ProductSkusEvaluationEntity(
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
    records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
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
    required this.orderProductId,
    required this.productSkusEvaluation,
    this.additionalEvaluation,
    required this.orderSn,
    required this.productSkusId,
    required this.productTitle,
    required this.productSkusTitle,
    required this.number,
    required this.receiver,
    this.avatar,
    required this.createdAt,
  });

  int id;
  int orderProductId;
  String productSkusEvaluation;
  dynamic additionalEvaluation;
  String orderSn;
  int productSkusId;
  String productTitle;
  String productSkusTitle;
  int number;
  String receiver;
  dynamic avatar;
  DateTime createdAt;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    id: json["id"],
    orderProductId: json["orderProductId"],
    productSkusEvaluation: json["productSkusEvaluation"],
    additionalEvaluation: json["additionalEvaluation"],
    orderSn: json["orderSn"],
    productSkusId: json["productSkusId"],
    productTitle: json["productTitle"],
    productSkusTitle: json["productSkusTitle"],
    number: json["number"],
    receiver: json["receiver"],
    avatar: json["avatar"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderProductId": orderProductId,
    "productSkusEvaluation": productSkusEvaluation,
    "additionalEvaluation": additionalEvaluation,
    "orderSn": orderSn,
    "productSkusId": productSkusId,
    "productTitle": productTitle,
    "productSkusTitle": productSkusTitle,
    "number": number,
    "receiver": receiver,
    "avatar": avatar,
    "createdAt": createdAt.toIso8601String(),
  };
}
