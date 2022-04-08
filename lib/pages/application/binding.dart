 import 'package:get/get.dart';

import 'logic.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationLogic());
  }
}
