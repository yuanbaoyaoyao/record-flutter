import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'new_consumables_state.dart';

class NewConsumablesLogic extends GetxController {
  final New_consumablesState state = New_consumablesState();

  late ScrollController scrollController;

  @override
  void onInit() {
    // TODO: implement onInit
    scrollController = ScrollController();

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
