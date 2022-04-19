import 'package:get/get.dart';

import 'message_box_logic.dart';

class MessageBoxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Message_boxLogic());
  }
}
