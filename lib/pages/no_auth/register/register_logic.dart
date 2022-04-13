import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register_state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();

  late final TextEditingController textNameEditingController;

  late final TextEditingController textAccountEditingController;

  late final TextEditingController textPasswordEditingController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textNameEditingController = TextEditingController();
    textAccountEditingController = TextEditingController();
    textPasswordEditingController = TextEditingController();
  }
}
