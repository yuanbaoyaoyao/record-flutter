// To parse this JSON data, do
//
//     final userAddressEntity = userAddressEntityFromJson(jsonString);

import 'dart:convert';

UserAddressEntity userAddressEntityFromJson(String str) =>
    UserAddressEntity.fromJson(json.decode(str));

String userAddressEntityToJson(UserAddressEntity data) =>
    json.encode(data.toJson());

class UserAddressEntity {
  UserAddressEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int? code;
  String? message;
  List<Datum>? data;

  factory UserAddressEntity.fromJson(Map<String, dynamic> json) =>
      UserAddressEntity(
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
    required this.userId,
    required this.addressDetail,
    required this.receiver,
    required this.user,
    required this.phone,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
  });

  int id;
  int userId;
  String addressDetail;
  String receiver;
  String user;
  String phone;
  bool isDefault;
  DateTime createdAt;
  DateTime updatedAt;
  bool deleted;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        addressDetail: json["addressDetail"],
        receiver: json["receiver"],
        user: json["user"],
        phone: json["phone"],
        isDefault: json["isDefault"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "addressDetail": addressDetail,
        "receiver": receiver,
        "user": user,
        "phone": phone,
        "isDefault": isDefault,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deleted": deleted,
      };
}

//UserAddressUpdateEntity

UserAddressUpdateEntity userAddressUpdateEntityFromJson(String str) => UserAddressUpdateEntity.fromJson(json.decode(str));

String userAddressUpdateEntityToJson(UserAddressUpdateEntity data) => json.encode(data.toJson());

class UserAddressUpdateEntity {
  UserAddressUpdateEntity({
    required this.id,
    required this.userId,
    required this.addressDetail,
    required this.receiver,
    required this.user,
    required this.phone,
    required this.isDefault,
  });

  int? id;
  int? userId;
  String? addressDetail;
  String? receiver;
  String? user;
  String? phone;
  bool? isDefault;

  factory UserAddressUpdateEntity.fromJson(Map<String, dynamic> json) => UserAddressUpdateEntity(
    id: json["id"],
    userId: json["userId"],
    addressDetail: json["addressDetail"],
    receiver: json["receiver"],
    user: json["user"],
    phone: json["phone"],
    isDefault: json["isDefault"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "addressDetail": addressDetail,
    "receiver": receiver,
    "user": user,
    "phone": phone,
    "isDefault": isDefault,
  };
}
