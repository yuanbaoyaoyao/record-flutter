import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'search_details_state.dart';

class SearchDetailsLogic extends GetxController {
  final SearchDetailsState state = SearchDetailsState();

  late final Offset endOffset;

  @override
  void onInit() {
    // TODO: implement onInit
    WidgetsBinding.instance?.addPostFrameCallback((c) {
      // 获取「购物车」的位置
      endOffset = (state.oldNewCartKey.currentContext!.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);
    });
    super.onInit();
  }
}
