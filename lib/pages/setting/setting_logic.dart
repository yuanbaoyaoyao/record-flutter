
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/user_api.dart';

import 'setting_state.dart';

class SettingLogic extends GetxController {
  final SettingState state = SettingState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void handleLogOut()async{
    UserAPI.logOut().then((value){
      Get.offAllNamed("/login");
    });
  }
}
