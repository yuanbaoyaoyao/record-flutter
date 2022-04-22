import 'package:get/get.dart';

import 'password_management_logic.dart';

class PasswordManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordManagementLogic());
  }
}
