import 'package:get/get.dart';
import 'package:record_flutter/pages/cart/cart_binding.dart';
import 'package:record_flutter/pages/cart/cart_logic.dart';
import 'package:record_flutter/pages/classification/classification_binding.dart';
import 'package:record_flutter/pages/classification/classification_logic.dart';
import 'package:record_flutter/pages/home/home_logic.dart';
import 'package:record_flutter/pages/mine/mine_logic.dart';

import 'application_logic.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationLogic());
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => ClassificationLogic());
    Get.lazyPut(() => CartLogic());
    Get.lazyPut(() => MineLogic());
  }
}
