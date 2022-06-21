// To parse this JSON data, do
//
//     final userOrderEntity = userOrderEntityFromJson(jsonString);

import 'dart:convert';

UserOrderEntity userOrderEntityFromJson(String str) => UserOrderEntity.fromJson(json.decode(str));

String userOrderEntityToJson(UserOrderEntity data) => json.encode(data.toJson());

class UserOrderEntity {
  UserOrderEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  Data data;

  factory UserOrderEntity.fromJson(Map<String, dynamic> json) => UserOrderEntity(
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
    required this.userId,
    required this.userAddressId,
    required this.receiver,
    required this.user,
    required this.addressDetail,
    required this.orderSn,
    required this.orderStatus,
    required this.orderRemarks,
    this.countOrderNumber,
    this.sumProductNumber,
    this.maxNumSkuName,
    this.timeFrame,
    this.timeUnit,
    required this.createdAt,
    this.orderProductVoList,
  });

  int id;
  int userId;
  int userAddressId;
  String receiver;
  String user;
  String addressDetail;
  double orderSn;
  int orderStatus;
  String orderRemarks;
  dynamic countOrderNumber;
  dynamic sumProductNumber;
  dynamic maxNumSkuName;
  dynamic timeFrame;
  dynamic timeUnit;
  DateTime createdAt;
  dynamic orderProductVoList;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    id: json["id"],
    userId: json["userId"],
    userAddressId: json["userAddressId"],
    receiver: json["receiver"],
    user: json["user"],
    addressDetail: json["addressDetail"],
    orderSn: json["orderSn"].toDouble(),
    orderStatus: json["orderStatus"],
    orderRemarks: json["orderRemarks"] == null ? null : json["orderRemarks"],
    countOrderNumber: json["countOrderNumber"],
    sumProductNumber: json["sumProductNumber"],
    maxNumSkuName: json["maxNumSkuName"],
    timeFrame: json["timeFrame"],
    timeUnit: json["timeUnit"],
    createdAt: DateTime.parse(json["createdAt"]),
    orderProductVoList: json["orderProductVoList"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "userAddressId": userAddressId,
    "receiver": receiver,
    "user": user,
    "addressDetail": addressDetail,
    "orderSn": orderSn,
    "orderStatus": orderStatus,
    "orderRemarks": orderRemarks == null ? null : orderRemarks,
    "countOrderNumber": countOrderNumber,
    "sumProductNumber": sumProductNumber,
    "maxNumSkuName": maxNumSkuName,
    "timeFrame": timeFrame,
    "timeUnit": timeUnit,
    "createdAt": createdAt.toIso8601String(),
    "orderProductVoList": orderProductVoList,
  };
}
