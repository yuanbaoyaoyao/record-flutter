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
      required int userId}) async {
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'list',
        data: {"pageSize": pageSize, "pageNum": pageNum, "userId": userId});

    return UserCollectEntity.fromJson(response);
  }

  static Future IsLikeUserCollectAPI(
      {required int productSkusId, required int userId}) async {
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'IsLike',
        data: {"productSkusId": productSkusId, "userId": userId});

    return UserCollectEntity.fromJson(response);
  }

  static Future createUserCollectAPI(
      {required UserCollectEntity userCollectEntity}) async {
    var response = await HttpUtil().post(
        UrlConstant.debugClientIp + request + 'create',
        data: userCollectEntity);

    return UserCollectEntity.fromJson(response);
  }

  static Future deleteUserCollectAPI(
      {required UserCollectEntity userCollectEntity}) async {
    var response = await HttpUtil().delete(
        UrlConstant.debugClientIp + request + 'delete',
        data: userCollectEntity);

    return UserCollectEntity.fromJson(response);
  }
}
