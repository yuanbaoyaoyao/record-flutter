import 'dart:developer';

import 'package:record_flutter/common/entities/order_product_entity.dart';

import '../constant/url_constant.dart';
import '../entities/front_show_entity.dart';
import '../utils/http_util.dart';

class OrderProductAPI {
  static String request = '/orderProductClient/';

  static Future listOrderProductAPI(
      {required int userOrderId,
      required int orderSn,
      required String productTitle,
      required String productSkusTitle}) async {
    var response = await HttpUtil()
        .get(UrlConstant.debugClientIp + request + 'list', data: {
      "userOrderId": userOrderId,
      "orderSn": orderSn,
      "productTitle": productTitle,
      "productSkusTitle": productSkusTitle
    });

    return OrderProductEntity.fromJson(response);
  }

  static Future createOrderProductAPI(
      {required OrderProductEntity orderProductEntity}) async {
    var response = await HttpUtil().post(
        UrlConstant.debugClientIp + request + 'create',
        data: orderProductEntity);

    return OrderProductEntity.fromJson(response);
  }
}
