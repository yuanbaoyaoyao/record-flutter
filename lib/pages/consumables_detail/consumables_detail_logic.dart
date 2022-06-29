import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/product_skus_api.dart';
import 'package:record_flutter/common/apis/user_address_api.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:sp_util/sp_util.dart';

import 'consumables_detail_state.dart';

class ConsumablesDetailLogic extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ConsumablesDetailState state = ConsumablesDetailState();

  late TabController tabController;

  late ScrollController scrollController;

  @override
  void onInit() {
    // TODO: implement onInit
    scrollController = ScrollController();
    tabController = TabController(length: state.tabs.length, vsync: this);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      subInitState();
    });

    scrollerAddListener();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadData();
  }

  void loadData() {
    int id = Get.arguments;
    getProductSkusInfo(id);
    getAddress();
  }

  void handleAddNumber() {
    if (state.number < state.productSkusInfo.data.records[0].stock) {
      state.number++;
    } else {
      EasyLoading.showToast("超过库存数量");
    }
  }

  void handleReduceNumber() {
    if (state.number > 1) {
      state.number--;
    } else {
      EasyLoading.showToast("至少购买一件哦！");
    }
  }

  void getAddress() async {
    await UserAddressAPI.listUserAddressAPI(
            userId: SpUtil.getInt(UserConstant.userId))
        .then((value) {
      state.addressList = value;
    });
  }

  void getProductSkusInfo(int id) async {
    await ProductSkusAPI.listProductSkusSearchIPageAPI(
            pageSize: 8,
            productName: '',
            id: id,
            productSkusName: '',
            pageNum: 1)
        .then((value) {
      state.productSkusInfo = value;
    });
  }

  void subInitState() {
    state.oneY = getY(state.headerWKey.currentContext);
    state.twoY = getY(state.evaluateWKey.currentContext);
    state.threeY = getY(state.detailWKey.currentContext);
  }

  double? getY(BuildContext? buildContext) {
    RenderObject? evaluationRenderObject = buildContext?.findRenderObject();
    return evaluationRenderObject?.getTransformTo(null).getTranslation().y;
  }

  void scrollerAddListener() {
    scrollController.addListener(() {
      var of =
          scrollController.offset + MediaQuery.of(Get.context!).padding.top;
      if (of > state.threeY - state.oneY) {
        tabController.animateTo(2);
      } else if (of > state.twoY - state.oneY) {
        tabController.animateTo(1);
      } else {
        tabController.animateTo(0);
      }
    });
  }

  void onScroll(double pixels) {
    print("使用中");
    state.appBarT = pixels / 50;
    if (state.appBarT < 0.0) {
      state.appBarT = 0.0;
    } else if (state.appBarT > 1.0) {
      state.appBarT = 1.0;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
