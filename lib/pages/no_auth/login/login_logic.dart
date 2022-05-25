import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/user_api.dart';
import 'package:record_flutter/common/entities/user_entity.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  late final PageController pageController;

  late final TextEditingController textAccountEditingController;

  late final TextEditingController textPasswordEditingController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textAccountEditingController = TextEditingController();
    textPasswordEditingController = TextEditingController();
  }

  void handleLogin() async {
    UserLoginEntity params = UserLoginEntity(
        username: textAccountEditingController.text,
        password: textPasswordEditingController.text);

    await UserAPI.login(params: params);
    Get.offNamed("/application");
  }
}
