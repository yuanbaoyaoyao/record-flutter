import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'old_consumables_logic.dart';

class OldConsumablesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<OldConsumablesLogic>();
    final state = Get.find<OldConsumablesLogic>().state;

    return Container(
      color: Colors.white,
      child: Text("这是旧耗材页"),
    );
  }
}
