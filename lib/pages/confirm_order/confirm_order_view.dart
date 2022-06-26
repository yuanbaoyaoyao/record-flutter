import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'confirm_order_logic.dart';

class ConfirmOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ConfirmOrderLogic>();
    final state = Get.find<ConfirmOrderLogic>().state;

    return Scaffold(
      appBar: AppBar(title: Text("确认订单")),
      body: Container(
        child: Text("这是确认订单页"),
      ),
    );
  }
}
