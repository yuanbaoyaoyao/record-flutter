import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/user_address_api.dart';
import 'package:record_flutter/pages/setting/setting_details/address_management/address_management_logic.dart';

import 'address_management_details_state.dart';

class AddressManagementDetailsLogic extends GetxController {
  final AddressManagementDetailsState state = AddressManagementDetailsState();

  final addressManagementLogic = Get.find<AddressManagementLogic>();

  late final TextEditingController receiverEditingController;

  late final TextEditingController phoneEditingController;

  late final TextEditingController userEditingController;

  late final TextEditingController addressDetailEditingController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    receiverEditingController = TextEditingController();
    phoneEditingController = TextEditingController();
    userEditingController = TextEditingController();
    addressDetailEditingController = TextEditingController();
    receiverEditingController.text = Get.arguments.receiver ?? "";
    phoneEditingController.text = Get.arguments.phone ?? "";
    userEditingController.text = Get.arguments.user ?? "";
    addressDetailEditingController.text = Get.arguments.addressDetail ?? "";
    if (Get.arguments.id == null) {
      state.isCreate = true;
    }
    state.isDefault = Get.arguments.isDefault;
  }

  void getInfo() {
    state.onTapAddress.id = Get.arguments.id;
    state.onTapAddress.userId = Get.arguments.userId;
    state.onTapAddress.addressDetail = addressDetailEditingController.text;
    state.onTapAddress.receiver = receiverEditingController.text;
    state.onTapAddress.user = userEditingController.text;
    state.onTapAddress.phone = phoneEditingController.text;
    state.onTapAddress.isDefault = state.isDefault;
  }

  void handleUpdateAddress() {
    getInfo();
    UserAddressAPI.updateUserAddressAPI(updateEntity: state.onTapAddress)
        .then((value) {
      EasyLoading.showToast("保存地址成功");
      Get.back();
      addressManagementLogic.loadData();
    });
  }

  void handleDeleteAddress() async {
    getInfo();
    await UserAddressAPI.deleteUserAddressAPI(updateEntity: state.onTapAddress)
        .then((value) {
      EasyLoading.showToast("删除地址成功");
      Get.back();
      addressManagementLogic.loadData();
    });
  }

  void handleCreateAddress() async {
    getInfo();
    await UserAddressAPI.createUserAddressAPI(updateEntity: state.onTapAddress)
        .then((value) {
      EasyLoading.showToast("新增地址成功");
      Get.back();
      addressManagementLogic.loadData();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    receiverEditingController.dispose();
    phoneEditingController.dispose();
    userEditingController.dispose();
    addressDetailEditingController.dispose();
  }
}
