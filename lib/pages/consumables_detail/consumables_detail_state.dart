import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/entities/product_skus_details_entity.dart';
import 'package:record_flutter/common/entities/product_skus_entity.dart';
import 'package:record_flutter/common/entities/user_address_entity.dart';

class ConsumablesDetailState {
//  试试PageStorageKey
  final headerWKey = GlobalKey();
  final evaluateWKey = GlobalKey();
  final detailWKey = GlobalKey();

  // PageStorageKey headerWKey = const PageStorageKey("headerW");
  // PageStorageBucket headerWPageStorageBucket = PageStorageBucket();
  // PageStorageKey evaluateWKey = const PageStorageKey("evaluateW");
  // PageStorageBucket evaluateWPageStorageBucket = PageStorageBucket();
  // PageStorageKey detailWKey = const PageStorageKey("detailW");
  // PageStorageBucket detailWPageStorageBucket = PageStorageBucket();

  // final testWKey = GlobalKey();

  final _evaluationAvatar = "".obs;
  final _evaluationName = "".obs;
  final _evaluationCreatedAt = "".obs;
  final _evaluation = "".obs;

  final _isLike = false.obs;
  final _collectionId = 0.obs;

  final _productSkusInfo =
      ProductSkusEntity(code: null, message: null, data: null).obs;

  final _addressList =
      UserAddressEntity(code: null, message: null, data: null).obs;

  final _productSkusDetails = [].obs;

  final _defaultAddress = "".obs;

  final _number = 1.obs;

  final _oneY = 0.0.obs;
  final _twoY = 0.0.obs;
  final _threeY = 0.0.obs;

  final _productSkusId = 0.obs;

  List tabs = ["耗材", "评价", "详情"];

  final _appBarT = 0.0.obs;

  final _recommendList = [].obs;

  final _cartCode = 0.obs;

  set productSkusId(value) => _productSkusId.value = value;

  get productSkusId => _productSkusId.value;

  set cartCode(value) => _cartCode.value = value;

  get cartCode => _cartCode.value;

  set evaluation(value) => _evaluation.value = value;

  get evaluation => _evaluation.value;

  set isLike(value) => _isLike.value = value;

  get isLike => _isLike.value;

  set collectionId(value) => _collectionId.value = value;

  get collectionId => _collectionId.value;

  set evaluationCreatedAt(value) => _evaluationCreatedAt.value = value;

  get evaluationCreatedAt => _evaluationCreatedAt.value;

  set evaluationName(value) => _evaluationName.value = value;

  get evaluationName => _evaluationName.value;

  set evaluationAvatar(value) => _evaluationAvatar.value = value;

  get evaluationAvatar => _evaluationAvatar.value;

  set addressList(value) => _addressList.value = value;

  get addressList => _addressList.value;

  set productSkusDetails(value) => _productSkusDetails.value = value;

  get productSkusDetails => _productSkusDetails;

  set defaultAddress(value) => _defaultAddress.value = value;

  get defaultAddress => _defaultAddress.value;

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

  set recommendList(value) => _recommendList.value = value;

  get recommendList => _recommendList;
}
