import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'collections_state.dart';

class CollectionsLogic extends GetxController {
  final CollectionsState state = CollectionsState();

  late final Offset endOffset;

  @override
  void onInit() {
    // TODO: implement onInit
    WidgetsBinding.instance?.addPostFrameCallback((c) {
      // 获取「购物车」的位置
      endOffset = (state.collectionKey.currentContext!.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);
    });
    super.onInit();
  }
}
