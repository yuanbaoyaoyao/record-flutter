import 'dart:developer';

import 'package:record_flutter/common/entities/user_address_entity.dart';
import 'package:record_flutter/common/entities/user_feedback_detail_entity.dart';

import '../constant/url_constant.dart';
import '../entities/front_show_entity.dart';
import '../utils/http_util.dart';

class UserFeedbackDetailAPI {
  static String request = '/userFeedbackDetailClient/';

  static Future listUserFeedbackDetailAPI({required int userFeedbackId}) async {
    Map<String, dynamic> map = {};
    map["userFeedbackId"] = userFeedbackId;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'list',
        queryParameters: map);

    return UserFeedbackDetailEntity.fromJson(response);
  }

  static Future createUserFeedbackDetailAPI(
      {required UserFeedbackDetailUpdateEntity updateEntity}) async {
    var response = await HttpUtil().post(
        UrlConstant.debugClientIp + request + 'create',
        data: updateEntity);

    return response;
  }
}
