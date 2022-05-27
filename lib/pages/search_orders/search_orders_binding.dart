import 'package:get/get.dart';

import 'search_orders_logic.dart';

class SearchOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchOrdersLogic());
  }
}
