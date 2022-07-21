import 'dart:developer';

import 'package:record_flutter/common/entities/user_address_entity.dart';
import 'package:record_flutter/common/entities/user_collect_entity.dart';

import '../constant/url_constant.dart';
import '../entities/front_show_entity.dart';
import '../utils/http_util.dart';

class UserCollectAPI {
  static String request = '/userCollectClient/';

  static Future listUserCollectAPI(
      {required int pageSize,
      required int pageNum,
      required int? userId}) async {
    Map<String, dynamic> map = {};
    map["userId"] = userId;
    map["pageSize"] = pageSize;
    map["pageNum"] = pageNum;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'list',
        queryParameters: map);

    return UserCollectEntity.fromJson(response);
  }

  static Future IsLikeUserCollectAPI(
      {required int productSkusId, required int? userId}) async {
    Map<String, dynamic> map = {};
    map["productSkusId"] = productSkusId;
    map["userId"] = userId;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'IsLike',
        queryParameters: map);

    return IsLikeCollectionEntity.fromJson(response);
  }

  static Future createUserCollectAPI(
      {required UserCollectionsCreateEntity
          userCollectionsCreateEntity}) async {
    var response = await HttpUtil().post(
        UrlConstant.debugClientIp + request + 'create',
        data: userCollectionsCreateEntity);

    return UserCollectionsCreateBackEntity.fromJson(response);
  }

  static Future deleteUserCollectAPI(
      {required UserCollectionsDeleteEntity
          userCollectionsDeleteEntity}) async {
    var response = await HttpUtil().delete(
        UrlConstant.debugClientIp + request + 'delete',
        data: userCollectionsDeleteEntity);

    return response;
  }
}
