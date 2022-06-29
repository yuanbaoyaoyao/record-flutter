import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/user_api.dart';
import 'package:record_flutter/common/entities/user_login_entity.dart';
import 'package:record_flutter/common/utils/toast_util.dart';

import 'register_state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();

  late final TextEditingController textNameEditingController;

  late final TextEditingController textEmailEditingController;

  late final TextEditingController textEmailCodeEditingController;

  late final TextEditingController textPasswordEditingController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textNameEditingController = TextEditingController();
    textEmailEditingController = TextEditingController();
    textEmailCodeEditingController = TextEditingController();
    textPasswordEditingController = TextEditingController();
  }

  void handleSendEmailCode() async {
    if (!isEmail(textEmailEditingController.text)) {
      EasyLoading.showToast("请输入正确的邮件格式");
    } else {
      await UserAPI.sendEmailCode(params: textEmailEditingController.text);
      ToastUtil().showToast("已发送验证码");
      handleCountDown();
    }
  }

  static bool isEmail(String input) {
    String regexEmail =
        "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}\$";
    if (input.isEmpty) return false;
    return RegExp(regexEmail).hasMatch(input);
  }

  void handleRegister() async {
    log("触发了handleRegister");
    // UserRegisterEntity params = UserRegisterEntity(
    //     name: textNameEditingController.text,
    //     password: textPasswordEditingController.text,
    //     email: textEmailEditingController.text,
    //     emailCode: textEmailCodeEditingController.text);
    // await UserAPI.register(params: params);
    // Get.back();
    // ToastUtil().showToast("注册成功");
  }

  void handleCountDown() {
    state.countDown = 60;
    late Timer _timer;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state.countDown -= 1;
      if (state.countDown == 0) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textNameEditingController.dispose();
    textEmailEditingController.dispose();
    textEmailCodeEditingController.dispose();
    textPasswordEditingController.dispose();
    super.dispose();
  }
}
