import 'package:record_flutter/common/entities/order_product_entity.dart';

import '../constant/url_constant.dart';
import '../utils/http_util.dart';

class OrderProductAPI {
  static String request = '/orderProductClient/';

  static Future listOrderProductAPI(
      {required int userOrderId,
      required int orderSn,
      required String productTitle,
      required String productSkusTitle}) async {
    Map<String, dynamic> map = {};
    map["userOrderId"] = userOrderId;
    map["orderSn"] = orderSn;
    map["productTitle"] = productTitle;
    map["productSkusTitle"] = productSkusTitle;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'list',
        queryParameters: map);

    return OrderProductEntity.fromJson(response);
  }

  static Future createOrderProductAPI(
      {required List<OrderProductCreateEntity> orderProductList}) async {
    var response = await HttpUtil().post(
        UrlConstant.debugClientIp + request + 'createList',
        data: orderProductList);

    return response;
  }
}
