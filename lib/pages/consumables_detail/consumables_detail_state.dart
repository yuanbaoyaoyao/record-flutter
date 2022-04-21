import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsumablesDetailState {
  final headerWKey = GlobalKey();
  final evaluateWKey = GlobalKey();
  final detailWKey = GlobalKey();

  final _oneY = 0.0.obs;
  final _twoY = 0.0.obs;
  final _threeY = 0.0.obs;

  List tabs = ["耗材", "评价", "详情"];

  final _appBarT = 0.0.obs;

  set oneY(value) => _oneY.value = value;

  get oneY => _oneY.value;

  set twoY(value) => _twoY.value = value;

  get twoY => _twoY.value;

  set threeY(value) => _threeY.value = value;

  get threeY => _threeY.value;

  set appBarT(value) => _appBarT.value = value;

  get appBarT => _appBarT.value;
}
