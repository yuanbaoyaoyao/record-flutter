import 'package:get/get.dart';
import 'package:record_flutter/pages/mine/mine_details/feedback/feedback_detail/feedback_detail_logic.dart';

import 'feedback_logic.dart';

class FeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeedbackLogic());
  }
}
