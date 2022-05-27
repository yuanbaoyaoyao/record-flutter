import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/pages/mine/mine_details/orders/widgets/order_appbar.dart';

import 'orders_logic.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<OrdersLogic>();
    final state = Get.find<OrdersLogic>().state;

    return Scaffold(
      appBar: buildOrdersAppBar(),
      body: SingleChildScrollView(
        child:Container(
          child: Text("这是订单页"),
        ),
      ),
    );
  }
}
