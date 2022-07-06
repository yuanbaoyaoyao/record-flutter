import 'package:get/get.dart';

class OrdersState {
  List tabs = ["全部", "审核中", "待收货", "待评价"];

  final _orderList = [].obs;

  final _countDown = 1.obs;

  final _orderProductList = [].obs;

  final _orderProductCount = [].obs;

  final _pageSize = 8.obs;

  final _status = 1.obs;

  set orderList(value) => _orderList.value = value;

  get orderList => _orderList;

  set orderProductList(value) => _orderProductList.value = value;

  get orderProductList => _orderProductList;

  set orderProductCount(value) => _orderProductCount.value = value;

  get orderProductCount => _orderProductCount;

  set pageSize(value) => _pageSize.value = value;

  get pageSize => _pageSize.value;

  set status(value) => _status.value = value;

  get status => _status.value;

  set countDown(value) => _countDown.value = value;

  get countDown => _countDown.value;
}
