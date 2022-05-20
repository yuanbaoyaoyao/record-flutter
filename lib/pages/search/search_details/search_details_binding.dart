import 'package:get/get.dart';

import 'search_details_logic.dart';

class SearchDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchDetailsLogic());
  }
}
