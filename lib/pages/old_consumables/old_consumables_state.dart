import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OldConsumablesState {

  GlobalKey oldNewCartKey = GlobalKey();

  final _appBarT = 0.0.obs;

  set appBarT(value) => _appBarT.value = value;

  get appBarT => _appBarT.value;

}
