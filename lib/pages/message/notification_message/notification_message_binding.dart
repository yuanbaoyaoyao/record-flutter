import 'package:get/get.dart';

import 'notification_message_logic.dart';

class Notification_messageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Notification_messageLogic());
  }
}
