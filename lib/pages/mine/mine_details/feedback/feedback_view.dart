import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feedback_logic.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<FeedbackLogic>();
    final state = Get.find<FeedbackLogic>().state;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text("这是反馈详情"),
      ),
    );
  }
}
