// To parse this JSON data, do
//
//     final announcementEntity = announcementEntityFromJson(jsonString);

import 'dart:convert';

AnnouncementEntity announcementEntityFromJson(String str) =>
    AnnouncementEntity.fromJson(json.decode(str));

String announcementEntityToJson(AnnouncementEntity data) =>
    json.encode(data.toJson());

class AnnouncementEntity {
  AnnouncementEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory AnnouncementEntity.fromJson(Map<String, dynamic> json) =>
      AnnouncementEntity(
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
    required this.content,
    required this.createdAt,
  });

  int id;
  String title;
  String content;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "createdAt": createdAt.toIso8601String(),
      };
}
