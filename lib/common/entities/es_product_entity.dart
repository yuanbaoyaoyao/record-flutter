// To parse this JSON data, do
//
//     final esProductEntity = esProductEntityFromJson(jsonString);

import 'dart:convert';

EsProductEntity esProductEntityFromJson(String str) => EsProductEntity.fromJson(json.decode(str));

String esProductEntityToJson(EsProductEntity data) => json.encode(data.toJson());

class EsProductEntity {
  EsProductEntity({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  Data data;

  factory EsProductEntity.fromJson(Map<String, dynamic> json) => EsProductEntity(
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
    required this.content,
    required this.pageable,
    required this.totalPages,
    required this.last,
    required this.totalElements,
    required this.number,
    required this.size,
    required this.sort,
    required this.numberOfElements,
    required this.first,
    required this.empty,
  });

  List<Content> content;
  Pageable pageable;
  int totalPages;
  bool last;
  int totalElements;
  int number;
  int size;
  Sort sort;
  int numberOfElements;
  bool first;
  bool empty;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    pageable: Pageable.fromJson(json["pageable"]),
    totalPages: json["totalPages"],
    last: json["last"],
    totalElements: json["totalElements"],
    number: json["number"],
    size: json["size"],
    sort: Sort.fromJson(json["sort"]),
    numberOfElements: json["numberOfElements"],
    first: json["first"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
    "pageable": pageable.toJson(),
    "totalPages": totalPages,
    "last": last,
    "totalElements": totalElements,
    "number": number,
    "size": size,
    "sort": sort.toJson(),
    "numberOfElements": numberOfElements,
    "first": first,
    "empty": empty,
  };
}

class Content {
  Content({
    required this.id,
    this.productId,
    required this.productName,
    required this.title,
    required this.avatar,
    required this.description,
    required this.stock,
  });

  int id;
  dynamic productId;
  String productName;
  String title;
  String avatar;
  String description;
  int stock;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    productId: json["productId"],
    productName: json["productName"],
    title: json["title"],
    avatar: json["avatar"],
    description: json["description"],
    stock: json["stock"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "productName": productName,
    "title": title,
    "avatar": avatar,
    "description": description,
    "stock": stock,
  };
}

class Pageable {
  Pageable({
    required this.sort,
    required this.offset,
    required this.pageNumber,
    required this.pageSize,
    required this.unpaged,
    required this.paged,
  });

  Sort sort;
  int offset;
  int pageNumber;
  int pageSize;
  bool unpaged;
  bool paged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
    sort: Sort.fromJson(json["sort"]),
    offset: json["offset"],
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    unpaged: json["unpaged"],
    paged: json["paged"],
  );

  Map<String, dynamic> toJson() => {
    "sort": sort.toJson(),
    "offset": offset,
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "unpaged": unpaged,
    "paged": paged,
  };
}

class Sort {
  Sort({
    required this.sorted,
    required this.unsorted,
    required this.empty,
  });

  bool sorted;
  bool unsorted;
  bool empty;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    sorted: json["sorted"],
    unsorted: json["unsorted"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "sorted": sorted,
    "unsorted": unsorted,
    "empty": empty,
  };
}
