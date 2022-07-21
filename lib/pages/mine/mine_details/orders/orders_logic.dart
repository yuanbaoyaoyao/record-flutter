import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/order_product_api.dart';
import 'package:record_flutter/common/apis/user_order_api.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:sp_util/sp_util.dart';

import 'orders_state.dart';

class OrdersLogic extends GetxController
    with GetSingleTickerProviderStateMixin {
  final OrdersState state = OrdersState();

  late TabController tabController;

  // late final RefreshController refreshController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: state.tabs.length, vsync: this);
    tabsAddListener();
    log("onInit()");
    // refreshController = RefreshController();
    state.orderList = [];
    if (Get.arguments != null) {
      int index = Get.arguments;
      tabController.index = index;
      log("tabController.index:" + tabController.index.toString());
    }else{
      getList();
    }
    handleCountDown();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    log("onReady()");
  }

  void tabsAddListener() {
    tabController.addListener(() {
      EasyLoading.show();
      if (tabController.index == 1) {
        getListByStatus(1);
      } else if (tabController.index == 2) {
        getListByStatus(2);
      } else if (tabController.index == 3) {
        getListByStatus(3);
      } else {
        getList();
      }
      EasyLoading.dismiss();
    });
  }

  void getList() async {
    await UserOrderAPI.listUserOrderIPageAPI(
            pageSize: state.pageSize,
            pageNum: 1,
            userId: SpUtil.getInt(UserConstant.userId),
            productTitle: null,
            productSkusTitle: null,
            orderSn: null,
            orderStatus: null,
            id: null)
        .then((value) {
      state.orderList = value.data.records;
      for (var data in state.orderList) {
        getOrderProduct(data.id);
      }
    });
  }

  void getListByStatus(int status) async {
    await UserOrderAPI.listUserOrderIPageAPI(
            pageSize: state.pageSize,
            pageNum: 1,
            userId: SpUtil.getInt(UserConstant.userId),
            productTitle: null,
            productSkusTitle: null,
            orderSn: null,
            orderStatus: status,
            id: null)
        .then((value) {
      state.orderList = value.data.records;
      for (var data in state.orderList) {
        getOrderProduct(data.id);
      }
    });
  }

  void getOrderProduct(int userOrderId) async {
    await OrderProductAPI.listOrderProductAPI(
            userOrderId: userOrderId,
            orderSn: null,
            productTitle: null,
            productSkusTitle: null)
        .then((value) {
      state.orderProductList.add(value);
      int temp = 0;
      for (var d in value.data) {
        temp += d.number as int;
      }
      state.orderProductCount.add(temp);
    });
  }

  void handleCountDown() {
    late Timer _timer;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state.countDown -= 1;
      if (state.countDown == 0) {
        _timer.cancel();
      }
    });
  }

  // void onRefresh() async {
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   log("刷新完成");
  //   state.pageSize = 8;
  //   getList();
  //   refreshController.refreshCompleted();
  // }
  //
  // void onLoading() async {
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   state.pageSize += 8;
  //   log("加載完成");
  //   getList();
  //   refreshController.loadComplete();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    // refreshController.dispose();
    super.dispose();
  }
}
