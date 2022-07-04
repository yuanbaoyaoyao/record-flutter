import 'package:record_flutter/common/entities/product_skus_details_entity.dart';
import 'package:record_flutter/common/entities/product_skus_evaluation_entity.dart';

import '../constant/url_constant.dart';
import '../utils/http_util.dart';

class ProductSkusDetailsAPI {
  static String request = '/productSkusDetailsClient/';

  static Future listProductSkusEvaluationAPI(
      {required int productSkusId}) async {
    Map<String, dynamic> map = {};
    map["productSkusId"] = productSkusId;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'list',
        queryParameters: map);

    return ProductSkusDetailsEntity.fromJson(response);
  }
}
