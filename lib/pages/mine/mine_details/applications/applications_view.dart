import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'applications_logic.dart';

class ApplicationsPage extends StatelessWidget {
  final logic = Get.find<ApplicationsLogic>();
  final state = Get.find<ApplicationsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text("这是申请页"),
      ),
    );
  }
}
