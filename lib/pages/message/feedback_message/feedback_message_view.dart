import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feedback_message_logic.dart';

class Feedback_messagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Feedback_messageLogic>();
    final state = Get.find<Feedback_messageLogic>().state;

    return Scaffold(
      appBar: AppBar(),
      body: Text("这是反馈信息列表"),
    );
  }
}
