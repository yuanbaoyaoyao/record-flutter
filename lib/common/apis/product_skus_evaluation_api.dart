import 'dart:developer';

import 'package:record_flutter/common/entities/product_skus_evaluation_entity.dart';

import '../constant/url_constant.dart';
import '../entities/front_show_entity.dart';
import '../utils/http_util.dart';

class ProductSkusEvaluationAPI {
  static String request = '/productSkusEvaluationClient/';

  static Future listProductSkusEvaluationIPageAPI(
      {required int pageSize,
      required int pageNum,
      required int? orderSn,
      required int? orderProductId,
      required int productSkusId}) async {
    Map<String, dynamic> map = {};
    map["pageSize"] = pageSize;
    map["pageNum"] = pageNum;
    map["orderSn"] = orderSn;
    map["orderProductId"] = orderProductId;
    map["productSkusId"] = productSkusId;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'listIPage',
        queryParameters: map);

    return ProductSkusEvaluationEntity.fromJson(response);
  }

  static Future listProductSkusEvaluationAPI(
      {required int orderSn,
      required int orderProductId,
      required int productSkusId}) async {
    Map<String, dynamic> map = {};
    map["orderSn"] = orderSn;
    map["orderProductId"] = orderProductId;
    map["productSkusId"] = productSkusId;
    var response = await HttpUtil().get(
        UrlConstant.debugClientIp + request + 'list',
        queryParameters: map);

    return ProductSkusEvaluationEntity.fromJson(response);
  }

  static Future createProductSkusEvaluationAPI(
      {required ProductSkusEvaluationEntity
          productSkusEvaluationEntity}) async {
    var response = await HttpUtil().post(
        UrlConstant.debugClientIp + request + 'create',
        data: productSkusEvaluationEntity);

    return ProductSkusEvaluationEntity.fromJson(response);
  }

  static Future updateProductSkusEvaluationAPI(
      {required ProductSkusEvaluationEntity
          productSkusEvaluationEntity}) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'update',
        data: productSkusEvaluationEntity);

    return ProductSkusEvaluationEntity.fromJson(response);
  }

  static Future deleteProductSkusEvaluationAPI(
      {required ProductSkusEvaluationEntity
          productSkusEvaluationEntity}) async {
    var response = await HttpUtil().delete(
        UrlConstant.debugClientIp + request + 'delete',
        data: productSkusEvaluationEntity);

    return ProductSkusEvaluationEntity.fromJson(response);
  }
}
