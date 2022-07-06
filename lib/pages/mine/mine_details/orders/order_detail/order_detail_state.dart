import 'package:get/get.dart';

class OrderDetailState {
  final _orderList = [].obs;

  final _orderProductList = [].obs;

  final _status = -2.obs;

  final _address = "".obs;

  final _orderSn = "".obs;

  final _createdAt = "".obs;

  set orderList(value) => _orderList.value = value;

  get orderList => _orderList;

  set orderProductList(value) => _orderProductList.value = value;

  get orderProductList => _orderProductList;

  set status(value) => _status;

  get status => _status;

  set address(value) => _address.value = value;

  get address => _address.value;

  set orderSn(value) => _orderSn.value = value;

  get orderSn => _orderSn.value;

  set createdAt(value) => _createdAt.value = value;

  get createdAt => _createdAt.value;
}
