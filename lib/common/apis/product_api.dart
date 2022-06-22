import 'dart:developer';

import 'package:record_flutter/common/entities/product_entity.dart';

import '../constant/url_constant.dart';
import '../entities/front_show_entity.dart';
import '../utils/http_util.dart';

class ProductAPI {
  static String request = '/productClient/';

  static Future listProductAllAPI({required String productName}) async {
    Map<String, dynamic> map = {};
    map["productName"] = productName;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'listAll',
        queryParameters: map);

    return ProductEntity.fromJson(response);
  }
}
