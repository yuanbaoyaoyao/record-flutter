import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/front_show_api.dart';

import 'old_consumables_state.dart';

class OldConsumablesLogic extends GetxController {
  final OldConsumablesState state = OldConsumablesState();

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
    await FrontShowAPI.listOldAPI().then((value) {
      state.productSkus = value;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }
}
