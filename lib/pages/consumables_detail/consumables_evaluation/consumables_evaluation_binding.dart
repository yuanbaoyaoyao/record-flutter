import 'package:get/get.dart';

import 'consumables_evaluation_logic.dart';

class ConsumablesEvaluationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConsumablesEvaluationLogic());
  }
}
