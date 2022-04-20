import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    // double T = pixels / 50;
    // if (T < 0.0) {
    //   T = 0.0;
    // } else if (T > 1.0) {
    //   T = 1.0;
    // }
    // state.appBarT = T;
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
