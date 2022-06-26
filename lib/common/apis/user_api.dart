//修改
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:record_flutter/common/constant/url_constant.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/common/entities/user_login_entity.dart';
import 'package:record_flutter/common/utils/encryption_util.dart';
import 'package:record_flutter/common/utils/http_util.dart';
import 'package:sp_util/sp_util.dart';

import '../entities/user_info_entity.dart';

class UserAPI {
  // static Future register({
  //   required UserRegisterEntity params,
  // }) async {
  //   params.password = EncryptionUtil().generateMD5(params.password);
  //   var response = await HttpUtil().post(
  //       UrlConstant.debugClientIp + '/client/user/register',
  //       data: params.toJson());
  //
  //   return response;
  // }

  static Future sendEmailCode({
    required String params,
  }) async {
    var response = await HttpUtil().post(UrlConstant.debugClientIp +
        '/client/user/sendEmailCode?email=' +
        params);
    return response;
  }

  static Future login({
    required UserLoginInputEntity userLoginInputEntity,
  }) async {
    userLoginInputEntity.password =
        EncryptionUtil().generateMD5(userLoginInputEntity.password);
    log("params.password:" + userLoginInputEntity.password);
    var response = await HttpUtil().post(
        UrlConstant.debugShiroIp + '/auth/client/login',
        data: userLoginInputEntity.toJson());
    SpUtil.putString(UserConstant.userTokenKey,
        UserLoginEntity.fromJson(response).data.token);
    SpUtil.putBool(UserConstant.isLogin, true);
    SpUtil.putInt(UserConstant.userId,
        UserLoginEntity.fromJson(response).data.userInfo.userId);
    return UserLoginEntity.fromJson(response);
  }

  static Future<UserInfoEntity> getUserInfo() async {
    var response =
        await HttpUtil().get(UrlConstant.debugShiroIp + '/auth/client/info');
    SpUtil.putInt(
        UserConstant.userId, UserInfoEntity.fromJson(response).data.id);
    return UserInfoEntity.fromJson(response);
  }

  static Future logOut() async {
    SpUtil.clear();
    await HttpUtil().post(UrlConstant.debugShiroIp + '/auth/client/logout');
  }
}
