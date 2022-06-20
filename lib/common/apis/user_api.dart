//修改
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:record_flutter/common/constant/url_constant.dart';
import 'package:record_flutter/common/entities/user_entity.dart';
import 'package:record_flutter/common/utils/encryption_util.dart';
import 'package:record_flutter/common/utils/http_util.dart';

class UserAPI {
  static Future register({
    required UserRegisterEntity params,
  }) async {
    params.password = EncryptionUtil().generateMD5(params.password);
    var response = await HttpUtil().post(
        UrlConstant.debugClientIp + '/client/user/register',
        data: params.toJson());

    return response;
  }

  static Future sendEmailCode({
    required String params,
  }) async {
    var response = await HttpUtil().post(UrlConstant.debugClientIp +
        '/client/user/sendEmailCode?email=' +
        params);
    return response;
  }

  static Future login({
    required UserLoginEntity params,
  }) async {
    params.password = EncryptionUtil().generateMD5(params.password);
    log("params.password:"+params.password);
    var response = await HttpUtil().post(
        UrlConstant.debugShiroIp + '/auth/client/login',
        data: params.toJson());
    return response;
  }

  static Future<UserInfoEntity> getUserInfo() async {
    var response = await HttpUtil().post('/auth/client/info');
    return UserInfoEntity.fromJson(response);
  }

  static Future logOut() async {
    await HttpUtil().post('/auth/client/logout');
  }
}
