import 'package:get/get.dart';

import 'orders_logic.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(() => OrdersLogic());
    Get.put(OrdersLogic());

  }
}
