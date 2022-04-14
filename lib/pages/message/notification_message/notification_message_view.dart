import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notification_message_logic.dart';

class Notification_messagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Notification_messageLogic>();
    final state = Get.find<Notification_messageLogic>().state;

    return Scaffold(
      appBar: AppBar(),
      body: Text("这是服务通知列表"),
    );
  }
}
