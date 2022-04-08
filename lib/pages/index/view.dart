import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<IndexLogic>();
    final state = Get.find<IndexLogic>().state;

    return Scaffold(
        appBar: AppBar(
          title: const Text("耗材管理系统"),
        ),
        body: Center(
          child: Text(
            '欢迎使用耗材管理系统',
            style: TextStyle(fontSize: 30.0),
          ),
        ));
  }
}
