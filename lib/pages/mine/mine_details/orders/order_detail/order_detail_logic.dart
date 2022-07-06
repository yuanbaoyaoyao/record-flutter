import 'dart:developer';

import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../../../common/apis/order_product_api.dart';
import '../../../../../common/apis/user_order_api.dart';
import '../../../../../common/constant/user_constant.dart';
import 'order_detail_state.dart';

class OrderDetailLogic extends GetxController {
  final OrderDetailState state = OrderDetailState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    int id = Get.arguments;
    log("idddddddddddddddd:" + id.toString());
    log("idddddddddddddddd:" + id.toString());
    log("idddddddddddddddd:" + id.toString());
    log("idddddddddddddddd:" + id.toString());
    log("idddddddddddddddd:" + id.toString());
    getList(id);
    getOrderProduct(id);
  }

  void getList(int id) async {
    await UserOrderAPI.listUserOrderIPageAPI(
            pageSize: 1,
            pageNum: 1,
            userId: SpUtil.getInt(UserConstant.userId),
            productTitle: null,
            productSkusTitle: null,
            orderSn: null,
            orderStatus: null,
            id: id)
        .then((value) {
      log("value.toJson().toString()" + value.toJson().toString());

      state.orderList = value.data.records;
      state.status = value.data.records[0].orderStatus;
      log("value.data.records[0].orderStatus:" +
          value.data.records[0].orderStatus.toString());
      state.address = value.data.records[0].receiver +
          "," +
          value.data.records[0].addressDetail;
      state.orderSn = value.data.records[0].orderSn.toString();
      state.createdAt = value.data.records[0].createdAt.toString();
    });
  }

  void getOrderProduct(int userOrderId) async {
    log("userOrderId:" + userOrderId.toString());
    log("userOrderId:" + userOrderId.toString());
    log("userOrderId:" + userOrderId.toString());
    log("userOrderId:" + userOrderId.toString());
    await OrderProductAPI.listOrderProductAPI(
            userOrderId: userOrderId,
            orderSn: null,
            productTitle: null,
            productSkusTitle: null)
        .then((value) {
      state.orderProductList = value.data;
      log("getOrderProduct:" + value.toJson().toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
