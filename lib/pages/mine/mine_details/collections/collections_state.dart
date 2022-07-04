import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CollectionsState {
  final _pageSize = 8.obs;

  final _productSkus = [].obs;

  final _length = 0.obs;

  GlobalKey oldNewCartKey = GlobalKey();

  set pageSize(value) => _pageSize.value = value;

  get pageSize => _pageSize.value;

  set productSkus(value) => _productSkus.value = value;

  get productSkus => _productSkus;

  set length(value) => _length.value = value;

  get length => _length.value;

  final _appBarT = 0.0.obs;

  set appBarT(value) => _appBarT.value = value;

  get appBarT => _appBarT.value;
}
