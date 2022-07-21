// To parse this JSON data, do
//
//     final userCollectEntity = userCollectEntityFromJson(jsonString);

import 'dart:convert';

UserCollectEntity userCollectEntityFromJson(String str) =>
    UserCollectEntity.fromJson(json.decode(str));

String userCollectEntityToJson(UserCollectEntity data) =>
    json.encode(data.toJson());

class UserCollectEntity {
  UserCollectEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  Data data;

  factory UserCollectEntity.fromJson(Map<String, dynamic> json) =>
      UserCollectEntity(
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
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
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
    required this.avatar,
    required this.title,
    required this.productName,
    required this.productSkusId,
    required this.description,
    required this.stock,
    this.createdAt,
  });

  int id;
  String avatar;
  String title;
  String productName;
  int productSkusId;
  String description;
  int stock;
  dynamic createdAt;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["id"],
        avatar: json["avatar"],
        title: json["title"],
        productName: json["productName"],
        productSkusId: json["productSkusId"],
        description: json["description"],
        stock: json["stock"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "title": title,
        "productName": productName,
        "productSkusId": productSkusId,
        "description": description,
        "stock": stock,
        "createdAt": createdAt,
      };
}

//isLikeCollectionEntity

IsLikeCollectionEntity isLikeCollectionEntityFromJson(String str) =>
    IsLikeCollectionEntity.fromJson(json.decode(str));

String isLikeCollectionEntityToJson(IsLikeCollectionEntity data) =>
    json.encode(data.toJson());

class IsLikeCollectionEntity {
  IsLikeCollectionEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory IsLikeCollectionEntity.fromJson(Map<String, dynamic> json) =>
      IsLikeCollectionEntity(
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
    this.userId,
    this.avatar,
    this.title,
    this.productName,
    this.productSkusId,
    this.stock,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deleted,
  });

  int id;
  dynamic userId;
  dynamic avatar;
  dynamic title;
  dynamic productName;
  dynamic productSkusId;
  dynamic stock;
  dynamic description;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deleted;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        avatar: json["avatar"],
        title: json["title"],
        productName: json["productName"],
        productSkusId: json["productSkusId"],
        stock: json["stock"],
        description: json["description"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "avatar": avatar,
        "title": title,
        "productName": productName,
        "productSkusId": productSkusId,
        "stock": stock,
        "description": description,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deleted": deleted,
      };
}

//userCollectionsCreateEntity

UserCollectionsCreateEntity userCollectionsCreateEntityFromJson(String str) =>
    UserCollectionsCreateEntity.fromJson(json.decode(str));

String userCollectionsCreateEntityToJson(UserCollectionsCreateEntity data) =>
    json.encode(data.toJson());

class UserCollectionsCreateEntity {
  UserCollectionsCreateEntity({
    required this.userId,
    required this.productSkusId,
  });

  int? userId;
  int productSkusId;

  factory UserCollectionsCreateEntity.fromJson(Map<String, dynamic> json) =>
      UserCollectionsCreateEntity(
        userId: json["userId"],
        productSkusId: json["productSkusId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "productSkusId": productSkusId,
      };
}

//userCollectionCreateBackEntity

UserCollectionsCreateBackEntity userCollectionsCreateBackEntityFromJson(
        String str) =>
    UserCollectionsCreateBackEntity.fromJson(json.decode(str));

String userCollectionsCreateBackEntityToJson(
        UserCollectionsCreateBackEntity data) =>
    json.encode(data.toJson());

class UserCollectionsCreateBackEntity {
  UserCollectionsCreateBackEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  DataBack data;

  factory UserCollectionsCreateBackEntity.fromJson(Map<String, dynamic> json) =>
      UserCollectionsCreateBackEntity(
        code: json["code"],
        message: json["message"],
        data: DataBack.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class DataBack {
  DataBack({
    required this.id,
    required this.userId,
    this.avatar,
    this.title,
    this.productName,
    required this.productSkusId,
    this.stock,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deleted,
  });

  int id;
  int userId;
  dynamic avatar;
  dynamic title;
  dynamic productName;
  int productSkusId;
  dynamic stock;
  dynamic description;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deleted;

  factory DataBack.fromJson(Map<String, dynamic> json) => DataBack(
        id: json["id"],
        userId: json["userId"],
        avatar: json["avatar"],
        title: json["title"],
        productName: json["productName"],
        productSkusId: json["productSkusId"],
        stock: json["stock"],
        description: json["description"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "avatar": avatar,
        "title": title,
        "productName": productName,
        "productSkusId": productSkusId,
        "stock": stock,
        "description": description,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deleted": deleted,
      };
}

//userCollectionsDeleteEntity

UserCollectionsDeleteEntity userCollectionsDeleteEntityFromJson(String str) =>
    UserCollectionsDeleteEntity.fromJson(json.decode(str));

String userCollectionsDeleteEntityToJson(UserCollectionsDeleteEntity data) =>
    json.encode(data.toJson());

class UserCollectionsDeleteEntity {
  UserCollectionsDeleteEntity({
    required this.id,
  });

  int id;

  factory UserCollectionsDeleteEntity.fromJson(Map<String, dynamic> json) =>
      UserCollectionsDeleteEntity(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
