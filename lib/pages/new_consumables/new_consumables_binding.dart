import 'package:get/get.dart';

import 'new_consumables_logic.dart';

class New_consumablesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => New_consumablesLogic());
  }
}
