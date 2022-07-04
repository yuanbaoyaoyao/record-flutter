// To parse this JSON data, do
//
//     final orderProductEntity = orderProductEntityFromJson(jsonString);

import 'dart:convert';

OrderProductEntity orderProductEntityFromJson(String str) =>
    OrderProductEntity.fromJson(json.decode(str));

String orderProductEntityToJson(OrderProductEntity data) =>
    json.encode(data.toJson());

class OrderProductEntity {
  OrderProductEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory OrderProductEntity.fromJson(Map<String, dynamic> json) =>
      OrderProductEntity(
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
    required this.userOrderId,
    this.receiver,
    required this.orderSn,
    this.orderStatus,
    this.countOrderNumber,
    this.sumProductNumber,
    required this.productId,
    required this.productSkusId,
    required this.productTitle,
    required this.productSkusTitle,
    required this.number,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userOrderId;
  dynamic receiver;
  int orderSn;
  dynamic orderStatus;
  dynamic countOrderNumber;
  dynamic sumProductNumber;
  int productId;
  int productSkusId;
  String productTitle;
  String productSkusTitle;
  int number;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userOrderId: json["userOrderId"],
        receiver: json["receiver"],
        orderSn: json["orderSn"],
        orderStatus: json["orderStatus"],
        countOrderNumber: json["countOrderNumber"],
        sumProductNumber: json["sumProductNumber"],
        productId: json["productId"],
        productSkusId: json["productSkusId"],
        productTitle: json["productTitle"],
        productSkusTitle: json["productSkusTitle"],
        number: json["number"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userOrderId": userOrderId,
        "receiver": receiver,
        "orderSn": orderSn,
        "orderStatus": orderStatus,
        "countOrderNumber": countOrderNumber,
        "sumProductNumber": sumProductNumber,
        "productId": productId,
        "productSkusId": productSkusId,
        "productTitle": productTitle,
        "productSkusTitle": productSkusTitle,
        "number": number,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

//List<OrderProductCreateEntity>
OrderProductCreateEntity orderProductCreateEntityFromJson(String str) =>
    OrderProductCreateEntity.fromJson(json.decode(str));

String orderProductCreateEntityToJson(OrderProductCreateEntity data) =>
    json.encode(data.toJson());

class OrderProductCreateEntity {
  OrderProductCreateEntity({
    required this.userOrderId,
    required this.orderSn,
    required this.productId,
    required this.productSkusId,
    required this.productTitle,
    required this.productSkusTitle,
    required this.number,
    required this.productPicUrl,
  });

  int userOrderId;
  int orderSn;
  int productId;
  int productSkusId;
  String productTitle;
  String productSkusTitle;
  int number;
  String productPicUrl;

  factory OrderProductCreateEntity.fromJson(Map<String, dynamic> json) =>
      OrderProductCreateEntity(
        userOrderId: json["userOrderId"],
        orderSn: json["orderSn"],
        productId: json["productId"],
        productSkusId: json["productSkusId"],
        productTitle: json["productTitle"],
        productSkusTitle: json["productSkusTitle"],
        number: json["number"],
        productPicUrl: json["productPicUrl"],
      );

  Map<String, dynamic> toJson() => {
        "userOrderId": userOrderId,
        "orderSn": orderSn,
        "productId": productId,
        "productSkusId": productSkusId,
        "productTitle": productTitle,
        "productSkusTitle": productSkusTitle,
        "number": number,
        "productPicUrl": productPicUrl,
      };
}
