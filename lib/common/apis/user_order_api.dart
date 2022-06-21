import 'package:record_flutter/common/entities/user_feedback_entity.dart';
import 'package:record_flutter/common/entities/user_order_entity.dart';

import '../constant/url_constant.dart';
import '../entities/cart_entity.dart';
import '../utils/http_util.dart';

class UserOrderAPI {
  static String request = '/userOrderClient/';

  static Future listUserOrderIPageAPI(
      {required int pageSize,
      required int pageNum,
      required int userId,
      required String productTitle,
      required String productSkusTitle,
      required int orderSn,
      required bool orderStatus}) async {
    var response = await HttpUtil()
        .get(UrlConstant.debugClientIp + request + 'list', data: {
      "pageSize": pageSize,
      "pageNum": pageNum,
      "userId": userId,
      "productTitle": productTitle,
      "productSkusTitle": productSkusTitle,
      "orderSn": orderSn,
      "orderStatus": orderStatus
    });

    return UserOrderEntity.fromJson(response);
  }

  static Future createUserOrderAPI({
    required UserOrderEntity userOrderEntity,
  }) async {
    var response = await HttpUtil().post(
        UrlConstant.debugClientIp + request + 'create',
        data: userOrderEntity);

    return UserOrderEntity.fromJson(response);
  }

  static Future deleteUserOrderAPI(
      {required UserOrderEntity userOrderEntity}) async {
    var response = await HttpUtil().delete(
        UrlConstant.debugClientIp + request + 'delete',
        data: userOrderEntity);

    return UserOrderEntity.fromJson(response);
  }

  static Future updateUserOrderAPI(
      {required UserOrderEntity userOrderEntity}) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'update',
        data: userOrderEntity);

    return UserOrderEntity.fromJson(response);
  }
}
