import 'package:get/get.dart';

import 'about_me_logic.dart';

class AboutMeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutMeLogic());
  }
}
