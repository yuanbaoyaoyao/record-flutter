import 'package:get/get.dart';

import 'applications_logic.dart';

class ApplicationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationsLogic());
  }
}
