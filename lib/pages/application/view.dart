import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ApplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ApplicationLogic>();
    final state = Get.find<ApplicationLogic>().state;

    return Scaffold(
      appBar: AppBar(title: Text("页面一"),),
      body: Center(child: Text('页面一',style: TextStyle(fontSize: 30.0),),),
    );
  }
}
