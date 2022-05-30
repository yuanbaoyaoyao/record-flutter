import 'package:get/get.dart';

import 'collections_logic.dart';

class CollectionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CollectionsLogic());
  }
}
