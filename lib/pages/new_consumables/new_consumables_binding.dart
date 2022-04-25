import 'package:get/get.dart';

import 'new_consumables_logic.dart';

class NewConsumablesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewConsumablesLogic());
  }
}
