import 'package:record_flutter/common/entities/product_skus_entity.dart';

import '../constant/url_constant.dart';
import '../entities/cart_entity.dart';
import '../utils/http_util.dart';

class CartAPI {
  static String request = '/productSkusClient/';

  static Future listProductSkusSearchIPageAPI(
      {required int pageSize,
      required int pageNum,
      required int id,
      required String productName,
      required String productSkusName}) async {
    var response = await HttpUtil()
        .get(UrlConstant.debugClientIp + request + 'listSearchIPage', data: {
      "pageSize": pageSize,
      "pageNum": pageNum,
      "id": id,
      "productName": productName,
      "productSkusName": productSkusName
    });

    return ProductSkusEntity.fromJson(response);
  }

  static Future listProductSkusSearchAPI(
      {required int id,
      required int productId,
      required String title,
      required String productSkusName}) async {
    var response = await HttpUtil()
        .get(UrlConstant.debugClientIp + request + 'listSearch', data: {
      "id": id,
      "productId": productId,
      "title": title,
      "productSkusName": productSkusName
    });

    return ProductSkusEntity.fromJson(response);
  }

  static Future listProductSkusLimitAPI() async {
    var response =
        await HttpUtil().get(UrlConstant.debugClientIp + request + 'listLimit');

    return ProductSkusEntity.fromJson(response);
  }

  static Future listProductSkusLimitByNumberAPI({required int number}) async {
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'listLimitByNumber',
        data: number);

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
