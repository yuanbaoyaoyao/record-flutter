import 'dart:developer';

import '../constant/url_constant.dart';
import '../entities/front_show_entity.dart';
import '../utils/http_util.dart';

class UploadPicAPI {
  static String request = '/upload/';

  static Future getTokenAPI() async {
    var response = await HttpUtil()
        .get(UrlConstant.debugAdminIp + request + 'qiniu/policy');

    return response;
  }
}
