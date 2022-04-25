import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ApplicationState {
  ///Initialize variables
  GlobalKey cartKey = GlobalKey();

  final _page = 0.obs;

  set page(value) => _page.value = value;

  get page => _page.value;
}
