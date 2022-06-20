import 'dart:developer';

import '../constant/url_constant.dart';
import '../entities/front_show_entity.dart';
import '../utils/http_util.dart';

class FrontShowAPI {
  static String request = '/frontShowClient/';

  static Future listFrontShowRotationAPI() async {
    var response = await HttpUtil()
        .get(UrlConstant.debugClientIp + request + 'listRotation');

    return FrontShowEntity.fromJson(response);
  }

  static Future listOldAPI() async {
    var response =
        await HttpUtil().get(UrlConstant.debugClientIp + request + 'listOld');

    return FrontShowEntity.fromJson(response);
  }

  static Future listNewAPI() async {
    var response =
        await HttpUtil().get(UrlConstant.debugClientIp + request + 'listNew');

    return FrontShowEntity.fromJson(response);
  }
}
