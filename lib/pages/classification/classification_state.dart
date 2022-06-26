import 'dart:ffi';

import 'package:get/get.dart';

class ClassificationState {
  final _navActive = [true].obs;

  final _products = [].obs;
  final _productSkus = [].obs;


  final _onTapProduct = 0.obs;
  final _onTapType = 1.obs;

  final _navButtonCount = 0.obs;

  final _pageSize = 8.obs;

  set products(value) => _products.value = value;

  get products => _products;

  set productSkus(value) => _productSkus.value = value;

  get productSkus => _productSkus;

  set navActive(value) => _navActive.value = value;

  get navActive => _navActive;

  set navButtonCount(value) => _navButtonCount.value = value;

  get navButtonCount => _navButtonCount.value;

  set onTapProduct(value) => _onTapProduct.value = value;

  get onTapProduct => _onTapProduct.value;

  set onTapType(value) => _onTapType.value = value;

  get onTapType => _onTapType.value;

  set pageSize(value) => _pageSize.value = value;

  get pageSize => _pageSize.value;
}
