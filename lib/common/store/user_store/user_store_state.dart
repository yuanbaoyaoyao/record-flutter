import 'package:get/get.dart';
import 'package:record_flutter/common/entities/user_entity.dart';

class UserStoreState {
  final _isLogin = false.obs;

  String token = "";

  final _userInfo = UserInfoEntity().obs;

  get userInfo => _userInfo.value;

  set isLogin(value) => _isLogin.value = value;

  get isLogin => _isLogin.value;
}
