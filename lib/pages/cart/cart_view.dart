import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_logic.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CartLogic>();
    final state = Get.find<CartLogic>().state;

    return Container(
      child: Text("这是购物车"),
    );
  }
}
