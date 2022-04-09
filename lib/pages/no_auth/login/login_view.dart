import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/router/app_pages.dart';

import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LoginLogic>();
    final state = Get.find<LoginLogic>().state;

    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.offAndToNamed(AppRoutes.Application),
        child: const Center(
          child: Text("这是登录页"),
        ),
      ),
    );
  }
}
