import 'dart:developer';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:record_flutter/common/apis/user_api.dart';

import '../../common/apis/product_skus_api.dart';
import 'mine_state.dart';

class MineLogic extends GetxController {
  final MineState state = MineState();

  late final RefreshController refreshController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
    refreshController = RefreshController();
  }

  void loadData() async {
    getList();
    getRecommendList();
  }

  void getList() async {
    await UserAPI.getUserInfo().then((value) {
      if (value.data?.avatar != null) {
        state.userAvatar = value.data?.avatar;
      }
      state.userName = value.data?.name;
    });
  }

  void getRecommendList() async {
    await ProductSkusAPI.listProductSkusSearchIPageAPI(
            pageSize: state.pageSize,
            pageNum: 1,
            id: 0,
            productName: "",
            productSkusName: "")
        .then((value) {
      state.recommendList = value.data.records;
    });
  }

  void onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    log("刷新完成");
    state.pageSize = 8;
    loadData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    log("加載完成");
    state.pageSize += 8;
    getRecommendList();
    refreshController.loadComplete();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    refreshController.dispose();
  }
}
