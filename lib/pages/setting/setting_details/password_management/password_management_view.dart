import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'password_management_logic.dart';

class PasswordManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PasswordManagementLogic>();
    final state = Get.find<PasswordManagementLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("修改密码"),
        centerTitle: true,
      ),
      body: Container(
        child: Text("这是修改密码页"),
      ),
    );
  }
}
