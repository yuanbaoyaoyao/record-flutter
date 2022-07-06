import 'dart:developer';

import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../../common/apis/user_address_api.dart';
import '../../../../common/constant/user_constant.dart';
import 'address_management_state.dart';

class AddressManagementLogic extends GetxController {
  final AddressManagementState state = AddressManagementState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    log("init");
    getAddress();
  }

  void loadData() {
    getAddress();
  }

  void getAddress() async {
    await UserAddressAPI.listUserAddressAPI(
            userId: SpUtil.getInt(UserConstant.userId))
        .then((value) {
      state.addressList = value;
      if (state.addressList.data.length == 5) {
        state.isLimit = true;
      } else {
        state.isLimit = false;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
