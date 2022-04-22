import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_me_logic.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AboutMeLogic>();
    final state = Get.find<AboutMeLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("关于我们"),
        centerTitle: true,
      ),
      body: Container(
        child: Text("这是关于我们页"),
      ),
    );
  }
}
