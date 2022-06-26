// To parse this JSON data, do
//
//     final cartEntity = cartEntityFromJson(jsonString);

import 'dart:convert';

CartEntity cartEntityFromJson(String str) =>
    CartEntity.fromJson(json.decode(str));

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
    required this.avatar,
    required this.title,
    required this.productName,
    required this.stock,
    this.checked,
    this.createdAt,
    this.updatedAt,
    this.deleted,
  });

  int id;
  int userId;
  int productSkusId;
  int productSkusNumber;
  String avatar;
  String title;
  String productName;
  int stock;
  dynamic checked;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deleted;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        productSkusId: json["productSkusId"],
        productSkusNumber: json["productSkusNumber"],
        avatar: json["avatar"],
        title: json["title"],
        productName: json["productName"],
        stock: json["stock"],
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
        "avatar": avatar,
        "title": title,
        "productName": productName,
        "stock": stock,
        "checked": checked,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deleted": deleted,
      };
}

CartUpdateEntity cartUpdateEntityFromJson(String str) => CartUpdateEntity.fromJson(json.decode(str));

String cartUpdateEntityToJson(CartUpdateEntity data) => json.encode(data.toJson());

class CartUpdateEntity {
  CartUpdateEntity({
    required this.id,
    required this.userId,
    required this.productSkusId,
    required this.productSkusNumber,
  });

  int? id;
  int? userId;
  int? productSkusId;
  int? productSkusNumber;

  factory CartUpdateEntity.fromJson(Map<String, dynamic> json) => CartUpdateEntity(
    id: json["id"],
    userId: json["userId"],
    productSkusId: json["productSkusId"],
    productSkusNumber: json["productSkusNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "productSkusId": productSkusId,
    "productSkusNumber": productSkusNumber,
  };
}


//CartDeleteEntity
CartDeleteEntity cartDeleteEntityFromJson(String str) =>
    CartDeleteEntity.fromJson(json.decode(str));

String cartDeleteEntityToJson(CartDeleteEntity data) =>
    json.encode(data.toJson());

class CartDeleteEntity {
  CartDeleteEntity({
    required this.id,
  });

  int id;

  factory CartDeleteEntity.fromJson(Map<String, dynamic> json) =>
      CartDeleteEntity(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
