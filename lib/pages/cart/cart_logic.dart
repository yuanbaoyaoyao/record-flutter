import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:record_flutter/common/apis/cart_api.dart';
import 'package:record_flutter/common/apis/product_skus_api.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/common/entities/cart_entity.dart';
import 'package:sp_util/sp_util.dart';

import 'cart_state.dart';

class CartLogic extends GetxController {
  final CartState state = CartState();

  late final RefreshController refreshController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
    refreshController = RefreshController();
  }

  void loadData() async {
    getCartList();
    getRecommendList();
  }

  void getCartList() async {
    await CartAPI.listCartAPI(userId: SpUtil.getInt(UserConstant.userId))
        .then((value) {
      state.cartList = value.data;
      log("value.toJson().toString()" + value.toJson().toString());
    });
  }

  void handleUpdateCartItem(int index) async {
    await CartAPI.updateCartAPI(cartUpdateEntity: state.onTapCartItem)
        .then((value) {
      state.cartList[index].productSkusNumber =
          state.onTapCartItem.productSkusNumber;
      getCartList();
    });
  }

  void handleCount() {
    state.checkedCartItemListNumber = 0;
    for (var item in state.checkedCartItemList) {
      state.checkedCartItemListNumber += item.productSkusNumber;
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
      onRefresh();
    });
  }

  void handleDeleteCartItem() async {
    await CartAPI.deleteCartAPI(
            cartDeleteEntity: CartDeleteEntity(id: state.onTapCartItem.id))
        .then((value) {});
  }

  void handleDeleteCartItemList() async {
    List<CartDeleteEntity> cartDeleteEntityList = [];
    for (var item in state.checkedCartItemList) {
      cartDeleteEntityList.add(CartDeleteEntity(id: item.id));
      log("item:" + item.toString());
    }
    await CartAPI.deleteCartListAPI(cartDeleteEntityList: cartDeleteEntityList)
        .then((value) {
      onRefresh();
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
    await Future.delayed(const Duration(milliseconds: 1000));
    log("刷新完成");
    state.pageSize = 8;
    state.checkedCartItemList = [];
    state.checkedCartItemListNumber = 0;
    loadData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    state.pageSize += 8;
    log("加載完成");
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
