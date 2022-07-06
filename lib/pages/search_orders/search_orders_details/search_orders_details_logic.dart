import 'dart:async';

import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../common/apis/order_product_api.dart';
import '../../../common/apis/user_order_api.dart';
import '../../../common/constant/user_constant.dart';
import 'search_orders_details_state.dart';

class SearchOrdersDetailsLogic extends GetxController {
  final SearchOrdersDetailsState state = SearchOrdersDetailsState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // refreshController = RefreshController();
    state.orderList = [];
    var keyword = Get.arguments;
    getList(keyword);
    handleCountDown();
  }

  void getList(String keyword) async {
    await UserOrderAPI.listUserOrderIPageAPI(
            pageSize: state.pageSize,
            pageNum: 1,
            userId: SpUtil.getInt(UserConstant.userId),
            productTitle: keyword,
            productSkusTitle: keyword,
            orderSn: int.tryParse(keyword),
            orderStatus: null,
            id: null)
        .then((value) {
      state.orderList = value.data.records;
      for (var data in state.orderList) {
        getOrderProduct(data.id);
      }
    });
  }

  void getOrderProduct(int userOrderId) async {
    await OrderProductAPI.listOrderProductAPI(
            userOrderId: userOrderId,
            orderSn: null,
            productTitle: null,
            productSkusTitle: null)
        .then((value) {
      state.orderProductList.add(value);
      int temp = 0;
      for (var d in value.data) {
        temp += d.number as int;
      }
      state.orderProductCount.add(temp);
    });
  }

  void handleCountDown() {
    late Timer _timer;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state.countDown -= 1;
      if (state.countDown == 0) {
        _timer.cancel();
      }
    });
  }
}
