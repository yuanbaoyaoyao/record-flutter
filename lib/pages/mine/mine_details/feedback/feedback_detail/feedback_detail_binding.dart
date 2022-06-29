import 'package:get/get.dart';

import 'feedback_detail_logic.dart';

class FeedbackDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeedbackDetailLogic());
  }
}
