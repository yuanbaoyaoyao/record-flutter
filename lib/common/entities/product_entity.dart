// To parse this JSON data, do
//
//     final productEntity = productEntityFromJson(jsonString);

import 'dart:convert';

ProductEntity productEntityFromJson(String str) =>
    ProductEntity.fromJson(json.decode(str));

String productEntityToJson(ProductEntity data) => json.encode(data.toJson());

class ProductEntity {
  ProductEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory ProductEntity.fromJson(Map<String, dynamic> json) => ProductEntity(
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
    required this.title,
    required this.avatar,
    required this.description,
    required this.createdAt,
  });

  int id;
  String title;
  String avatar;
  String description;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        avatar: json["avatar"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "avatar": avatar,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
      };
}
