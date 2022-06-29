import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feedback_detail_logic.dart';

class FeedbackDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<FeedbackDetailLogic>();
    final state = Get.find<FeedbackDetailLogic>().state;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text("这是反馈详情页"),
      ),
    );
  }
}
