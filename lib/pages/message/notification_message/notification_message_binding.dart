import 'package:get/get.dart';

import 'notification_message_logic.dart';

class NotificationMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Notification_messageLogic());
  }
}
