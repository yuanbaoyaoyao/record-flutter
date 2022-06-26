import 'package:get/get.dart';
import 'package:record_flutter/common/entities/user_login_entity.dart';

class UserStoreState {
  final _isLogin = false.obs;

  set isLogin(value) => _isLogin.value = value;

  get isLogin => _isLogin.value;

}
