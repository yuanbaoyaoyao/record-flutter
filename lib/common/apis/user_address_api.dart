import 'dart:developer';

import 'package:record_flutter/common/entities/user_address_entity.dart';

import '../constant/url_constant.dart';
import '../entities/front_show_entity.dart';
import '../utils/http_util.dart';

class UserAddressAPI {
  static String request = '/client/userAddress/';

  static Future listUserAddressAPI({required int userId}) async {
    Map<String, dynamic> map = {};
    map["userId"] = userId;
    var response = await HttpUtil()
        .get(UrlConstant.debugClientIp + request + 'list', queryParameters: map);

    return UserAddressEntity.fromJson(response);
  }

  static Future listOneUserAddressAPI({required int id}) async {
    Map<String, dynamic> map = {};
    map["id"] = id;
    var response = await HttpUtil()
        .get(UrlConstant.debugClientIp + request + 'listOne', queryParameters: map);

    return UserAddressEntity.fromJson(response);
  }

  static Future createUserAddressAPI(
      {required UserAddressEntity userAddressEntity}) async {
    var response = await HttpUtil().post(
        UrlConstant.debugClientIp + request + 'create',
        data: userAddressEntity);

    return UserAddressEntity.fromJson(response);
  }

  static Future deleteUserAddressAPI(
      {required UserAddressEntity userAddressEntity}) async {
    var response = await HttpUtil().delete(
        UrlConstant.debugClientIp + request + 'delete',
        data: userAddressEntity);

    return UserAddressEntity.fromJson(response);
  }

  static Future updateUserAddressAPI(
      {required UserAddressEntity userAddressEntity}) async {
    var response = await HttpUtil().put(
        UrlConstant.debugClientIp + request + 'update',
        data: userAddressEntity);

    return UserAddressEntity.fromJson(response);
  }
}
