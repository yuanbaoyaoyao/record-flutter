import 'dart:developer';

import 'package:record_flutter/common/entities/es_product_entity.dart';

import '../constant/url_constant.dart';
import '../entities/front_show_entity.dart';
import '../utils/http_util.dart';

class ElasticsearchAPI {
  static String request = '/esProduct/';

  static Future listFrontShowRotationAPI(
      {required int pageSize,
      required int pageNum,
      required String keyword}) async {
    Map<String, dynamic> map = {};
    map["pageSize"] = pageSize;
    map["pageNum"] = pageNum;
    map["keyword"] = keyword;
    var response = await HttpUtil().get(
        UrlConstant.debugSearchIp + request + 'search',
        queryParameters: map);

    return EsProductEntity.fromJson(response);
  }
}
