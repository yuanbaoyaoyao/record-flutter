import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/apis/elasticsearch_api.dart';
import 'search_details_state.dart';

class SearchDetailsLogic extends GetxController
    with GetSingleTickerProviderStateMixin {
  final SearchDetailsState state = SearchDetailsState();

  late final Offset endOffset;

  late TabController tabController;

  @override
  void onInit() {
    // TODO: implement onInit
    WidgetsBinding.instance?.addPostFrameCallback((c) {
      // 获取「购物车」的位置
      endOffset =
          (state.oldNewCartKey.currentContext!.findRenderObject() as RenderBox)
              .localToGlobal(Offset.zero);
    });
    super.onInit();
    tabController = TabController(length: state.tabs.length, vsync: this);
    state.keyword = Get.arguments;
    getList(state.keyword);
  }

  void getList(String keyword) async {
    await ElasticsearchAPI.search(
            pageSize: state.pageSize, pageNum: 1, keyword: keyword)
        .then((value) {
      log("value:" + value.toJson().toString());
      state.productSkusList = value.data.content;
    });
  }

  void getListByStock() async {
    await ElasticsearchAPI.searchByStock(
            pageSize: state.pageSize, pageNum: 1, keyword: state.keyword)
        .then((value) {
      log("valueByStock" + value.toJson().toString());
      state.productSkusList = value.data.content;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }
}
