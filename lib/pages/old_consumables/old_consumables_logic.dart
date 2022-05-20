import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
      endOffset = (state.oldNewCartKey.currentContext!.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);
    });

    super.onInit();
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
    scrollController.dispose();
    super.dispose();
  }
}
