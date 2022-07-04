import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/order_product_api.dart';
import 'package:record_flutter/common/apis/user_order_api.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/common/entities/order_product_entity.dart';
import 'package:record_flutter/common/entities/user_order_entity.dart';
import 'package:sp_util/sp_util.dart';

import '../../common/apis/cart_api.dart';
import '../../common/apis/user_address_api.dart';
import '../../common/entities/cart_entity.dart';
import '../cart/cart_logic.dart';
import '../cart/cart_state.dart';
import 'confirm_order_state.dart';

class ConfirmOrderLogic extends GetxController {
  final ConfirmOrderState state = ConfirmOrderState();
  final cartState = Get.find<CartLogic>().state;
  final cartLogic = Get.find<CartLogic>();

  late final TextEditingController orderRemarksController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    orderRemarksController = TextEditingController();

    load();
  }

  void load() {
    getAddress();
  }

  void handleCreateOrderProduct(int userOrderId, int orderSn) async {
    List<OrderProductCreateEntity> orderProductList = [];
    for (var data in cartState.checkedCartItemList) {
      orderProductList.add(OrderProductCreateEntity(
          userOrderId: userOrderId,
          orderSn: orderSn,
          productId: data.productId,
          productSkusId: data.productSkusId,
          productTitle: data.productName,
          productSkusTitle: data.title,
          number: data.productSkusNumber,
          productPicUrl: data.avatar));
    }
    await OrderProductAPI.createOrderProductAPI(
            orderProductList: orderProductList)
        .then((value) {
      handleDeleteCartItemList();
    });
  }

  void handleDeleteCartItemList() async {
    List<CartDeleteEntity> cartDeleteEntityList = [];
    for (var item in cartState.checkedCartItemList) {
      cartDeleteEntityList.add(CartDeleteEntity(id: item.id));
    }
    await CartAPI.deleteCartListAPI(cartDeleteEntityList: cartDeleteEntityList)
        .then((value) {
      Get.offAndToNamed("/order_detail", arguments: state.orderId);
      cartLogic.onRefresh();
    });
  }

  void handleCreateOrder() async {
    await UserOrderAPI.createUserOrderAPI(
            userOrderCreateEntity: state.userOrder)
        .then((value) {
      EasyLoading.showToast("创建订单成功", duration: const Duration(seconds: 2));
      state.orderId = value.data.id;
      handleCreateOrderProduct(value.data.id, value.data.orderSn.toInt());
    });
  }

  void getAddress() async {
    await UserAddressAPI.listUserAddressAPI(
            userId: SpUtil.getInt(UserConstant.userId))
        .then((value) {
      state.addressList = value;
      for (var data in state.addressList.data) {
        if (data.isDefault == true) {
          state.receiver = data.receiver;
          state.addressDetail = data.addressDetail;
          state.defaultAddressTemp = data.addressDetail;
          state.phone = data.phone;

          state.userOrder.userAddressId = data.id;
          state.userOrder.receiver = data.receiver;
          state.userOrder.user = data.user;
          state.userOrder.addressDetail = data.addressDetail;
          break;
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    orderRemarksController.dispose();
  }
}
