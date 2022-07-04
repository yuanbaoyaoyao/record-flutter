import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/user_collect_api.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:sp_util/sp_util.dart';

import 'collections_state.dart';

class CollectionsLogic extends GetxController {
  final CollectionsState state = CollectionsState();

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
    await UserCollectAPI.listUserCollectAPI(
            pageSize: state.pageSize,
            pageNum: 1,
            userId: SpUtil.getInt(UserConstant.userId))
        .then((value) {
      state.productSkus = value.data.records;
      log("value.toJson().toString()"+value.toJson().toString());
    });
    // await FrontShowAPI.listOldAPI().then((value) {
    //   state.productSkus = value;
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }
}
