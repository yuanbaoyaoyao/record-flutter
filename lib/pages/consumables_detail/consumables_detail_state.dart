import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/entities/product_skus_entity.dart';
import 'package:record_flutter/common/entities/user_address_entity.dart';

class ConsumablesDetailState {
//  试试PageStorageKey
  final headerWKey = GlobalKey();
  final evaluateWKey = GlobalKey();
  final detailWKey = GlobalKey();

  final _productSkusInfo =
      ProductSkusEntity(code: null, message: null, data: null).obs;

  final _addressList = UserAddressEntity(code: null, message: null, data: null).obs;

  final _number = 1.obs;

  final _oneY = 0.0.obs;
  final _twoY = 0.0.obs;
  final _threeY = 0.0.obs;

  List tabs = ["耗材", "评价", "详情"];

  final _appBarT = 0.0.obs;

  set addressList(value) => _addressList.value = value;

  get addressList => _addressList.value;

  set productSkusInfo(value) => _productSkusInfo.value = value;

  get productSkusInfo => _productSkusInfo.value;

  set number(value) => _number.value = value;

  get number => _number.value;

  set oneY(value) => _oneY.value = value;

  get oneY => _oneY.value;

  set twoY(value) => _twoY.value = value;

  get twoY => _twoY.value;

  set threeY(value) => _threeY.value = value;

  get threeY => _threeY.value;

  set appBarT(value) => _appBarT.value = value;

  get appBarT => _appBarT.value;
}
