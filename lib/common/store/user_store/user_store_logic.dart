import 'dart:convert';

import 'package:get/get.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/common/entities/user_entity.dart';
import 'package:record_flutter/common/store/user_store/user_store_state.dart';
import 'package:sp_util/sp_util.dart';


class CartLogic extends GetxController {
  final UserStoreState state = UserStoreState();
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.token = SpUtil.getString(UserConstant.userTokenKey)!;
    var userInfo = SpUtil.getString(UserConstant.userInfoKey)!;
    if(userInfo.isNotEmpty){
      state.userInfo(UserInfoEntity.fromJson(jsonDecode(userInfo)));
    }
  }
}
