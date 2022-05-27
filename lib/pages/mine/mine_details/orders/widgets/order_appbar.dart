import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/pages/mine/mine_details/orders/orders_logic.dart';
import 'package:sp_util/sp_util.dart';

import '../../../../../res/constant.dart';

final logic = Get.find<OrdersLogic>();
final state = Get.find<OrdersLogic>().state;

AppBar buildOrdersAppBar() {
  return AppBar(
    title: Container(
      alignment: Alignment.center,
      child: Text("订单"),
    ),
    actions: [
      Container(
        child:
        IconButton(
          onPressed: () {
            Get.toNamed("/message_box");
          },
          icon: const Icon(
            Icons.search,
            size: 30.0,
          ),
        ),
        margin: const EdgeInsets.only(right: 8.0),
      )
    ],
    bottom: TabBar(
      controller: logic.tabController,
      isScrollable: false,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _buildTabsItemList(),
    ),
  );
}

List<Widget> _buildTabsItemList() => List.generate(state.tabs.length, (index) {
      return Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text("${state.tabs[index]}"),
      );
    });
