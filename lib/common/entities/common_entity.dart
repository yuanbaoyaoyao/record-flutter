// To parse this JSON data, do
//
//     final commonEntity = commonEntityFromJson(jsonString);

import 'dart:convert';

CommonEntity commonEntityFromJson(String str) => CommonEntity.fromJson(json.decode(str));

String commonEntityToJson(CommonEntity data) => json.encode(data.toJson());

class CommonEntity {
  CommonEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int? code;
  String? message;
  String? data;

  factory CommonEntity.fromJson(Map<String, dynamic> json) => CommonEntity(
    code: json["code"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data,
  };
}
