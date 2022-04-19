import 'package:get/get.dart';

import 'feedback_message_logic.dart';

class FeedbackMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Feedback_messageLogic());
  }
}
