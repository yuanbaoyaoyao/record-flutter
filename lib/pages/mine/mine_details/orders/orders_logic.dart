import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'orders_state.dart';

class OrdersLogic extends GetxController
    with GetSingleTickerProviderStateMixin {
  final OrdersState state = OrdersState();

  late TabController tabController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: state.tabs.length, vsync: this);
  }

}
