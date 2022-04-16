import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'new_consumables_logic.dart';

class New_consumablesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<New_consumablesLogic>();
    final state = Get.find<New_consumablesLogic>().state;

    return Container(
      color: Colors.white,
      child: Text("这是新耗材页"),
    );
  }
}
