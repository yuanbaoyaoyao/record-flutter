import 'package:record_flutter/common/entities/product_skus_entity.dart';

import '../constant/url_constant.dart';
import '../entities/cart_entity.dart';
import '../utils/http_util.dart';

class ProductSkusAPI {
  static String request = '/productSkusClient/';

  static Future listProductSkusSearchIPageAPI(
      {required int pageSize,
      required int pageNum,
      required int id,
      required String productName,
      required String productSkusName}) async {
    Map<String, dynamic> map = {};
    map["pageSize"] = pageSize;
    map["pageNum"] = pageNum;
    map["id"] = id;
    map["productName"] = productName;
    map["productSkusName"] = productSkusName;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'listSearchIPage',
        queryParameters: map);

    return ProductSkusEntity.fromJson(response);
  }

  static Future listProductSkusByTypeIPageAPI(
      {required int pageSize, required int pageNum, required int type}) async {
    Map<String, dynamic> map = {};
    map["pageSize"] = pageSize;
    map["pageNum"] = pageNum;
    map["type"] = type;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'listByTypeIPage',
        queryParameters: map);

    return ProductSkusEntity.fromJson(response);
  }

  static Future listProductSkusSearchAPI(
      {required int id,
      required int productId,
      required String title,
      required String productSkusName}) async {
    Map<String, dynamic> map = {};
    map["id"] = id;
    map["productId"] = productId;
    map["title"] = title;
    map["productSkusName"] = productSkusName;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'listSearch',
        queryParameters: map);

    return ProductSkusEntity.fromJson(response);
  }

  static Future listProductSkusLimitAPI() async {
    var response =
        await HttpUtil().get(UrlConstant.debugClientIp + request + 'listLimit');

    return ProductSkusEntity.fromJson(response);
  }

  static Future listProductSkusLimitByNumberAPI({required int number}) async {
    Map<String, dynamic> map = {};
    map["number"] = number;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'listLimitByNumber',
        queryParameters: map);

    return ProductSkusEntity.fromJson(response);
  }

  static Future updateProductSkusAPI(
      {required ProductSkusEntity productSkusEntity}) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'update',
        data: productSkusEntity);

    return ProductSkusEntity.fromJson(response);
  }
}
