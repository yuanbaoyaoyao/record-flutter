import 'package:record_flutter/common/entities/user_feedback_detail_entity.dart';
import 'package:record_flutter/common/entities/user_feedback_entity.dart';

import '../constant/url_constant.dart';
import '../entities/cart_entity.dart';
import '../utils/http_util.dart';

class UserFeedbackAPI {
  static String request = '/userFeedbackClient/';

  static Future listUserFeedbackAPI(
      {required int pageSize,
      required int pageNum,
      required int? userId}) async {
    Map<String, dynamic> map = {};
    map["pageSize"] = pageSize;
    map["pageNum"] = pageNum;
    map["userId"] = userId;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'list',
        queryParameters: map);

    return UserFeedbackEntity.fromJson(response);
  }

  static Future createUserFeedbackAPI({
    required UserFeedbackEntity userFeedbackEntity,
  }) async {
    var response = await HttpUtil().post(
        UrlConstant.debugClientIp + request + 'create',
        data: userFeedbackEntity);

    return UserFeedbackEntity.fromJson(response);
  }

  static Future updateUserFeedbackFinishedAPI(
      {required UserFeedbackUpdateEntity updateEntity}) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'updateFinished',
        data: updateEntity);

    return response;
  }
}
