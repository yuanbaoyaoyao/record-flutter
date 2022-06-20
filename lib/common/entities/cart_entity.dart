// To parse this JSON data, do
//
//     final cartEntity = cartEntityFromJson(jsonString);

import 'dart:convert';

CartEntity cartEntityFromJson(String str) => CartEntity.fromJson(json.decode(str));

String cartEntityToJson(CartEntity data) => json.encode(data.toJson());

class CartEntity {
  CartEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory CartEntity.fromJson(Map<String, dynamic> json) => CartEntity(
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
    required this.productSkusId,
    required this.productSkusNumber,
    this.checked,
    this.createdAt,
    this.updatedAt,
    this.deleted,
  });

  int id;
  int userId;
  int productSkusId;
  int productSkusNumber;
  dynamic checked;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deleted;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["userId"],
    productSkusId: json["productSkusId"],
    productSkusNumber: json["productSkusNumber"],
    checked: json["checked"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    deleted: json["deleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "productSkusId": productSkusId,
    "productSkusNumber": productSkusNumber,
    "checked": checked,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "deleted": deleted,
  };
}
