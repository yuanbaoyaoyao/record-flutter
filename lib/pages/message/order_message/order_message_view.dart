import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'order_message_logic.dart';

class OrderMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Order_messageLogic>();
    final state = Get.find<Order_messageLogic>().state;

    return Scaffold(
      appBar: AppBar(),
      body: Text("这是订单信息列表"),
    );
  }
}
