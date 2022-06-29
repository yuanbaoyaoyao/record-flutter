import 'package:get/get.dart';

import 'order_message_logic.dart';

class OrderMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderMessageLogic());
  }
}
