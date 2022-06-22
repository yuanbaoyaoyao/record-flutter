import 'dart:developer';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'mine_state.dart';

class MineLogic extends GetxController {
  final MineState state = MineState();

  late final RefreshController refreshController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    refreshController = RefreshController();
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    refreshController.dispose();
  }
}
