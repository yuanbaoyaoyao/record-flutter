import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  }
}
