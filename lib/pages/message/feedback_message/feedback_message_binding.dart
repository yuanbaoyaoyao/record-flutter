import 'package:get/get.dart';

import 'feedback_message_logic.dart';

class Feedback_messageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Feedback_messageLogic());
  }
}
