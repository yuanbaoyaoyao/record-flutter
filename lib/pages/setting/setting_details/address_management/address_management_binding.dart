import 'package:get/get.dart';

import 'address_management_logic.dart';

class AddressManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressManagementLogic());
  }
}
