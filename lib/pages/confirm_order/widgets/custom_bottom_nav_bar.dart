import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:record_flutter/pages/cart/cart_logic.dart';
import 'package:record_flutter/pages/confirm_order/confirm_order_logic.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomBottomNavBarState();
  }
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final logic = Get.find<ConfirmOrderLogic>();
  final state = Get.find<ConfirmOrderLogic>().state;
  final cartState = Get.find<CartLogic>().state;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Row(
      children: [
        Text("合计："),
        Text(
          cartState.checkedCartItemListNumber.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
        Text("件"),
        Expanded(child: Text("")),
        Container(
          width: ScreenUtil().setWidth(80),
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.red,
          ),
          child: TextButton(
              onPressed: () {
                // Get.toNamed("/confirm_order");
                logic.handleCreateOrder();
              },
              child: Text("确认订单")),
        )
      ],
    ));
  }
}
