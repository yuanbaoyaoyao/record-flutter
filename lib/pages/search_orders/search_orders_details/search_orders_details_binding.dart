import 'package:get/get.dart';

import 'search_orders_details_logic.dart';

class SearchOrdersDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchOrdersDetailsLogic());
  }
}
