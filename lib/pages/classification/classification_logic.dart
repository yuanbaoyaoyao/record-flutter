import 'dart:developer';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:record_flutter/common/apis/product_skus_api.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/common/entities/user_info_entity.dart';
import 'package:record_flutter/common/store/user_store/user_store_state.dart';
import 'package:sp_util/sp_util.dart';

import '../../common/apis/product_api.dart';
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
    state.pageSize = 8;
    loadData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    log("加載完成");
    state.pageSize += 8;
    getList();
    refreshController.loadComplete();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    loadData();
    // initNavActive(state.products.length);
    // initNavButtonCount(state.products.length);
    refreshController = RefreshController();

    super.onInit();
  }

  void loadData() async {
    getClassification();
  }

  void getClassification() async {
    await ProductAPI.listProductAllAPI(productName: '').then((value) {
      state.products = value.data;
      state.onTapProduct = value.data[0].id;
      initNavActive(state.products.length);
      initNavButtonCount(state.products.length);
      getList();
    });
  }

  void getList() async {
    await ProductSkusAPI.listCountByProductIdAndTypeIPage(
        pageSize: state.pageSize,
        pageNum: 1,
        productId: state.onTapProduct,
        userId: SpUtil.getInt(UserConstant.userId),
        type: state.onTapType)
        .then((value) {
      state.productSkus = value.data.records;
    });
  }

  void handleChangeNavButton(int index){
    state.onTapProduct = state.products[index].id;
    getList();
    clearNavActive();
    state.navActive[index] = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    refreshController.dispose();
  }
}
