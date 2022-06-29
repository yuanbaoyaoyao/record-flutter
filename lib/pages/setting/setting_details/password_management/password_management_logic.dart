import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/entities/user_login_entity.dart';

import '../../../../common/apis/user_api.dart';
import '../../../../common/utils/toast_util.dart';
import 'password_management_state.dart';

class PasswordManagementLogic extends GetxController {
  final PasswordManagementState state = PasswordManagementState();

  late final TextEditingController emailEditingController;

  late final TextEditingController emailCodeEditingController;

  late final TextEditingController passwordEditingController;

  late final TextEditingController passwordConfirmEditingController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailEditingController = TextEditingController();
    emailCodeEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    passwordConfirmEditingController = TextEditingController();
  }

  void handleUpdatePassword() async {
    await UserAPI.forget(
            userForgetEntity: UserForgetEntity(
                email: emailEditingController.text,
                emailCode: emailCodeEditingController.text,
                password: passwordEditingController.text))
        .then((value) {
      if (value.code == 200) {
        EasyLoading.showToast("修改密码成功");
        Get.back();
      }
    });
  }

  void handleSendEmailCode() async {
    if (!isEmail(emailEditingController.text)) {
      EasyLoading.showToast("请输入正确的邮件格式");
    } else {
      await UserAPI.sendEmailCode(params: emailEditingController.text)
          .then((value) {
        if (value.code == 500) {
          EasyLoading.showToast("邮件不存在，请重新输入");
        } else {
          ToastUtil().showToast("已发送验证码");
          handleCountDown();
        }
      });
    }
  }

  static bool isEmail(String input) {
    String regexEmail =
        "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}\$";
    if (input.isEmpty) return false;
    return RegExp(regexEmail).hasMatch(input);
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
    super.dispose();
    emailCodeEditingController.dispose();
    emailCodeEditingController.dispose();
    passwordEditingController.dispose();
    passwordConfirmEditingController.dispose();
  }
}
