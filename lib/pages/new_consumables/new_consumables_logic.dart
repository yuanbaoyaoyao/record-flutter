import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:record_flutter/pages/cart/cart_logic.dart';
import 'package:sp_util/sp_util.dart';

import '../../common/apis/cart_api.dart';
import '../../common/apis/front_show_api.dart';
import '../../common/constant/user_constant.dart';
import '../../common/entities/cart_entity.dart';
import 'new_consumables_state.dart';

class NewConsumablesLogic extends GetxController {
  final NewConsumablesState state = NewConsumablesState();
  final cartLogic = Get.find<CartLogic>();

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

  void getInfo() async {
    await FrontShowAPI.listNewAPI().then((value) {
      state.productSkus = value;
      log("value:" + value.toJson().toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }
}
