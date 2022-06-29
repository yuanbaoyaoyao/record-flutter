// To parse this JSON data, do
//
//     final emailConfirmEntity = emailConfirmEntityFromJson(jsonString);

import 'dart:convert';

EmailConfirmEntity emailConfirmEntityFromJson(String str) => EmailConfirmEntity.fromJson(json.decode(str));

String emailConfirmEntityToJson(EmailConfirmEntity data) => json.encode(data.toJson());

class EmailConfirmEntity {
  EmailConfirmEntity({
    required this.code,
    required this.message,
    this.data,
  });

  int code;
  String message;
  dynamic data;

  factory EmailConfirmEntity.fromJson(Map<String, dynamic> json) => EmailConfirmEntity(
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
