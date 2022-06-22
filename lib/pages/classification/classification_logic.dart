import 'dart:developer';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'classification_state.dart';

class ClassificationLogic extends GetxController {
  final ClassificationState state = ClassificationState();

  late final RefreshController refreshController;

  void initNavButtonCount(int count) {
    state.navButtonCount = count;
  }

  void initNavActive(int count) {
    for (int i = 0; i < count; i++) {
      state.navActive.add(false);
    }
  }

  void clearNavActive() {
    for (int i = 0; i < state.navActive.length; i++) {
      if (state.navActive[i] == true) {
        state.navActive[i] = false;
        break;
      }
    }
  }

  void onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    log("刷新完成");
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    log("加載完成");
    refreshController.loadComplete();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initNavActive(16);
    initNavButtonCount(16);
    refreshController = RefreshController();

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    refreshController.dispose();
  }
}
