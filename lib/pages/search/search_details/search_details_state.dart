import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchDetailsState {
  GlobalKey oldNewCartKey = GlobalKey();

  List tabs = ["综合", "库存量"];

  final _productSkusList = [].obs;

  final _pageSize = 8.obs;

  final _keyword = "".obs;

  set pageSize(value) => _pageSize.value = value;

  get pageSize => _pageSize.value;

  set productSkusList(value) => _productSkusList.value = value;

  get productSkusList => _productSkusList;

  set keyword(value) => _keyword.value = value;

  get keyword => _keyword.value;
}
