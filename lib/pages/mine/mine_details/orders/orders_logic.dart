import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/user_order_api.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:sp_util/sp_util.dart';

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
    getList();
  }

  void getList() async {
    await UserOrderAPI.listUserOrderIPageAPI(
            pageSize: state.pageSize,
            pageNum: 1,
            userId: SpUtil.getInt(UserConstant.userId),
            productTitle: null,
            productSkusTitle: null,
            orderSn: null,
            orderStatus: null)
        .then((value) {
      state.orderList = value.data.records;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }
}
