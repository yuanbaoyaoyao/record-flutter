import 'package:get/get.dart';

class OrdersState {
  List tabs = ["全部", "待确认", "待收货", "待评价"];

  final _orderList = [].obs;

  final _pageSize = 8.obs;

  set orderList(value) => _orderList.value = value;

  get orderList => _orderList;

  set pageSize(value) => _pageSize.value = value;

  get pageSize => _pageSize.value;
}
