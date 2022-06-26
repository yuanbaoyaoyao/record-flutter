import 'package:get/get.dart';

import 'confirm_order_logic.dart';

class ConfirmOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmOrderLogic());
  }
}
