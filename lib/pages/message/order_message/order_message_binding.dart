import 'package:get/get.dart';

import 'order_message_logic.dart';

class Order_messageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Order_messageLogic());
  }
}
