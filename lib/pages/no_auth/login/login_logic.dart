import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
