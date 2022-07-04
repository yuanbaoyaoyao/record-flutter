// To parse this JSON data, do
//
//     final productSkusDetailsEntity = productSkusDetailsEntityFromJson(jsonString);

import 'dart:convert';

ProductSkusDetailsEntity productSkusDetailsEntityFromJson(String str) =>
    ProductSkusDetailsEntity.fromJson(json.decode(str));

String productSkusDetailsEntityToJson(ProductSkusDetailsEntity data) =>
    json.encode(data.toJson());

class ProductSkusDetailsEntity {
  ProductSkusDetailsEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int? code;
  String? message;
  List<Datum>? data;

  factory ProductSkusDetailsEntity.fromJson(Map<String, dynamic> json) =>
      ProductSkusDetailsEntity(
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
    this.productId,
    required this.avatar,
    required this.sequence,
    required this.createdAt,
  });

  int id;
  dynamic productId;
  String avatar;
  int sequence;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productId: json["productId"],
        avatar: json["avatar"],
        sequence: json["sequence"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "avatar": avatar,
        "sequence": sequence,
        "createdAt": createdAt.toIso8601String(),
      };
}
