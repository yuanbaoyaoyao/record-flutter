import 'package:get/get.dart';

import 'old_consumables_logic.dart';

class OldConsumablesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OldConsumablesLogic());
  }
}
