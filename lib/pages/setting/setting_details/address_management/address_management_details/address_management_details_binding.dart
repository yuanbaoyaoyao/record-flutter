import 'package:get/get.dart';

import 'address_management_details_logic.dart';

class AddressManagementDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressManagementDetailsLogic());
  }
}
