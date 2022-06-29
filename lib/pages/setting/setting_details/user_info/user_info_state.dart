import 'package:get/get.dart';
import 'package:record_flutter/common/entities/user_info_entity.dart';

import '../../../../common/entities/common_entity.dart';

class UserInfoState {
  final _userInfo = UserInfoEntity(code: null, message: null, data: null).obs;

  final _avatar = "".obs;
  final _userName = "".obs;

  final _isGallery = false.obs;
  final _isCamera = false.obs;

  set userInfo(value) => _userInfo.value = value;

  get userInfo => _userInfo.value;

  set avatar(value) => _avatar.value = value;

  get avatar => _avatar.value;

  set userName(value) => _userName.value = value;

  get userName => _userName.value;

  set isGallery(value) => _isGallery.value = value;

  get isGallery => _isGallery.value;

  set isCamera(value) => _isCamera.value = value;

  get isCamera => _isCamera.value;
}
