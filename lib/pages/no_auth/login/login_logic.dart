import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/user_api.dart';
import 'package:record_flutter/common/entities/user_login_entity.dart';
import 'package:record_flutter/common/store/user_store/user_store_state.dart';
import 'package:sp_util/sp_util.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  final UserStoreState userStoreState = UserStoreState();

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
    UserLoginInputEntity params = UserLoginInputEntity(
        username: textAccountEditingController.text,
        password: textPasswordEditingController.text);

    await UserAPI.login(userLoginInputEntity: params);
    Get.offNamed("/application");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textAccountEditingController.dispose();
    textPasswordEditingController.dispose();
  }
}
