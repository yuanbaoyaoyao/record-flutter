import 'dart:developer';

import 'package:record_flutter/common/entities/user_address_entity.dart';
import 'package:record_flutter/common/entities/user_feedback_detail_entity.dart';

import '../constant/url_constant.dart';
import '../entities/front_show_entity.dart';
import '../utils/http_util.dart';

class UserFeedbackDetailAPI {
  static String request = '/userFeedbackDetailClient/';

  static Future listUserFeedbackDetailAPI({required int userFeedbackId}) async {
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'list',
        data: userFeedbackId);

    return UserFeedbackDetailEntity.fromJson(response);
  }

  static Future createUserFeedbackDetailAPI(
      {required UserFeedbackDetailEntity userFeedbackDetailEntity}) async {
    var response = await HttpUtil().post(
        UrlConstant.debugClientIp + request + 'create',
        data: userFeedbackDetailEntity);

    return UserFeedbackDetailEntity.fromJson(response);
  }
}
