import 'package:get/get.dart';

import 'consumables_detail_logic.dart';

class ConsumablesDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        ConsumablesDetailLogic()
    );
  }
}
