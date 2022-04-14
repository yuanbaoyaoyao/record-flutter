import 'package:get/get.dart';

import 'message_box_logic.dart';

class Message_boxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Message_boxLogic());
  }
}
