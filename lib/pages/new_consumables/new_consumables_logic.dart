import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/apis/front_show_api.dart';
import 'new_consumables_state.dart';

class NewConsumablesLogic extends GetxController {
  final NewConsumablesState state = NewConsumablesState();

  late final Offset endOffset;

  late ScrollController scrollController;

  @override
  void onInit() {
    // TODO: implement onInit
    scrollController = ScrollController();

    WidgetsBinding.instance?.addPostFrameCallback((c) {
      // 获取「购物车」的位置
      endOffset =
          (state.oldNewCartKey.currentContext!.findRenderObject() as RenderBox)
              .localToGlobal(Offset.zero);
    });
    getInfo();
    super.onInit();
  }

  void onScroll(double pixels) {
    state.appBarT = pixels / 50;
    if (state.appBarT < 0.0) {
      state.appBarT = 0.0;
    } else if (state.appBarT > 1.0) {
      state.appBarT = 1.0;
    }
  }

  void getInfo() async {
    await FrontShowAPI.listNewAPI().then((value) {
      state.productSkus = value;
      log("value:" + value.toJson().toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }
}
