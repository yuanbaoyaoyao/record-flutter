import 'package:record_flutter/common/entities/user_feedback_entity.dart';
import 'package:record_flutter/common/entities/user_reminder_entity.dart';

import '../constant/url_constant.dart';
import '../entities/cart_entity.dart';
import '../utils/http_util.dart';

class UserReminderAPI {
  static String request = '/userReminderClient/';

  static Future listUserReminderAPI({required int? userId}) async {
    Map<String, dynamic> map = {};
    map["userId"] = userId;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'list',
        queryParameters: map);

    return UserReminderEntity.fromJson(response);
  }

  static Future updateUserReminderAPI({
    required UserReminderUpdateEntity updateEntity,
  }) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'update',
        data: updateEntity);

    return response;
  }

  static Future updateUserReminderListAPI(
      {required List<UserReminderUpdateEntity> updateEntityList}) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'updateByIds',
        data: updateEntityList);

    return response;
  }

  static Future deleteUserReminderAPI(
      {required UserReminderUpdateEntity updateEntity}) async {
    var response = await HttpUtil().delete(
        UrlConstant.debugClientIp + request + 'delete',
        data: updateEntity);

    return response;
  }

  static Future deleteUserReminderListAPI(
      {required List<UserReminderUpdateEntity> updateEntityList}) async {
    var response = await HttpUtil().delete(
        UrlConstant.debugClientIp + request + 'deleteByIds',
        data: updateEntityList);

    return response;
  }
}
