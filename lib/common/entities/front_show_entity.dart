// To parse this JSON data, do
//
//     final frontShowEntity = frontShowEntityFromJson(jsonString);

import 'dart:convert';

FrontShowEntity frontShowEntityFromJson(String str) =>
    FrontShowEntity.fromJson(json.decode(str));

String frontShowEntityToJson(FrontShowEntity data) =>
    json.encode(data.toJson());

class FrontShowEntity {
  FrontShowEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int? code;
  String? message;
  List<Datum>? data;

  factory FrontShowEntity.fromJson(Map<String, dynamic> json) =>
      FrontShowEntity(
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
    required this.productSkusId,
    required this.productSkusName,
    required this.productName,
    required this.avatar,
    required this.stock,
    required this.description,
    this.showRotation,
    this.showOld,
    this.showNew,
    this.createdAt,
  });

  int id;
  int productSkusId;
  String productSkusName;
  String productName;
  String avatar;
  int stock;
  String? description;
  dynamic showRotation;
  dynamic showOld;
  dynamic showNew;
  dynamic createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productSkusId: json["productSkusId"],
        productSkusName: json["productSkusName"],
        productName: json["productName"],
        description: json["description"],
        avatar: json["avatar"],
        stock: json["stock"],
        showRotation: json["showRotation"],
        showOld: json["showOld"],
        showNew: json["showNew"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productSkusId": productSkusId,
        "productSkusName": productSkusName,
        "productName": productName,
        "description": description,
        "avatar": avatar,
        "stock": stock,
        "showRotation": showRotation,
        "showOld": showOld,
        "showNew": showNew,
        "createdAt": createdAt,
      };
}
