import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:record_flutter/common/apis/user_api.dart';
import 'package:sp_util/sp_util.dart';

import '../../common/apis/cart_api.dart';
import '../../common/apis/product_skus_api.dart';
import '../../common/constant/user_constant.dart';
import '../../common/entities/cart_entity.dart';
import '../cart/cart_logic.dart';
import 'mine_state.dart';

class MineLogic extends GetxController {
  final MineState state = MineState();
  final cartLogic = Get.find<CartLogic>();
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

  void handleAddIntoCart(int productSkusId, int productSkusNumber) async {
    await CartAPI.createCartAPI(
            createEntity: CartCreateEntity(
                userId: SpUtil.getInt(UserConstant.userId),
                productSkusId: productSkusId,
                productSkusNumber: productSkusNumber))
        .then((value) {
      EasyLoading.showToast("加入购物车成功");
      cartLogic.onRefresh();
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
