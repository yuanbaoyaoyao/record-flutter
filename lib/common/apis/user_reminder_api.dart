import 'package:record_flutter/common/entities/user_feedback_entity.dart';
import 'package:record_flutter/common/entities/user_reminder_entity.dart';

import '../constant/url_constant.dart';
import '../entities/cart_entity.dart';
import '../utils/http_util.dart';

class UserReminderAPI {
  static String request = '/userReminderClient/';

  static Future listUserReminderAPI({required int userId}) async {
    Map<String, dynamic> map = {};
    map["userId"] = userId;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'list',
        queryParameters: map);

    return UserReminderEntity.fromJson(response);
  }

  static Future updateUserReminderAPI({
    required UserReminderEntity userReminderEntity,
  }) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'update',
        data: userReminderEntity);

    return UserReminderEntity.fromJson(response);
  }

  static Future updateUserReminderListAPI(
      {required UserReminderEntity userReminderEntity}) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'updateByIds',
        data: userReminderEntity);

    return UserReminderEntity.fromJson(response);
  }

  static Future deleteUserReminderAPI(
      {required UserReminderEntity userReminderEntity}) async {
    var response = await HttpUtil().delete(
        UrlConstant.debugClientIp + request + 'delete',
        data: userReminderEntity);

    return UserReminderEntity.fromJson(response);
  }

  static Future deleteUserReminderListAPI(
      {required UserReminderEntity userReminderEntity}) async {
    var response = await HttpUtil().delete(
        UrlConstant.debugClientIp + request + 'deleteByIds',
        data: userReminderEntity);

    return UserReminderEntity.fromJson(response);
  }
}
