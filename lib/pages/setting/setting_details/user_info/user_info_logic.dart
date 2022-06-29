import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record_flutter/common/apis/user_api.dart';

import 'user_info_state.dart';

class UserInfoLogic extends GetxController {
  final UserInfoState state = UserInfoState();

  final ImagePicker imagePicker = ImagePicker();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInfo();
  }

  Future handleGetImage(BuildContext context) async {
    late XFile? image;
    if (state.isGallery == true) {
      image = await imagePicker.pickImage(source: ImageSource.gallery);
      state.isGallery = false;
    } else if (state.isCamera == true) {
      image = await imagePicker.pickImage(source: ImageSource.camera);
      state.isCamera = false;
    }
    if (image != null) {
      EasyLoading.showToast("修改头像成功");
      Navigator.pop(context);
    }
  }

  void getInfo() async {
    await UserAPI.getUserInfo().then((value) {
      state.userInfo = value;
      if (state.userInfo.data.avatar != null) {
        state.avatar = state.userInfo.data.avatar;
      }
      state.userName = state.userInfo.data.name;
    });
  }
}
