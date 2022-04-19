import 'dart:ffi';

import 'package:get/get.dart';

class ClassificationState {
  final List<bool> _navActive = [true].obs;

  final _navButtonCount = 0.obs;

  set navActive(value) => _navActive;

  get navActive => _navActive;

  set navButtonCount(value) => _navButtonCount.value = value;

  get navButtonCount => _navButtonCount.value;
}
