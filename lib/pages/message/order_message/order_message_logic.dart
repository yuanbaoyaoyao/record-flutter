import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../common/apis/user_reminder_api.dart';
import '../../../common/constant/user_constant.dart';
import '../../../common/entities/user_reminder_entity.dart';
import '../message_box/message_box_logic.dart';
import 'order_message_state.dart';

class OrderMessageLogic extends GetxController {
  final OrderMessageState state = OrderMessageState();

  final logic = Get.find<MessageBoxLogic>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  void loadData() {
    state.message = [];
    logic.loadData();
    handleGetReminders();
  }

  void handleGetReminders() async {
    await UserReminderAPI.listUserReminderAPI(
            userId: SpUtil.getInt(UserConstant.userId))
        .then((value) {
      for (var data in value.data) {
        if (data.orderProductId != null) {
          state.message.add(data);
        }
      }
    });
  }

  void handleUpdate() async {
    await UserReminderAPI.updateUserReminderAPI(
            updateEntity: state.onTapMessage)
        .then((value) {
      // state.message = [];
      loadData();
    });
  }

  void handleUpdateList() async {
    List<UserReminderUpdateEntity> updateEntityList = [];
    for (var data in state.message) {
      if (data.orderProductId != null) {
        updateEntityList.add(UserReminderUpdateEntity(id: data.id));
      }
    }
    await UserReminderAPI.updateUserReminderListAPI(
            updateEntityList: updateEntityList)
        .then((value) {
      EasyLoading.showToast("全部已读成功");
      loadData();
    });
  }

  void handleDelete() async {
    await UserReminderAPI.deleteUserReminderAPI(
            updateEntity: UserReminderUpdateEntity(id: state.onTapMessage.id))
        .then((value) {
      EasyLoading.showToast("删除成功");
      loadData();
    });
  }

  void handleDeleteList() async {
    List<UserReminderUpdateEntity> updateEntityList = [];
    for (var data in state.message) {
      if (data.orderProductId != null) {
        updateEntityList.add(UserReminderUpdateEntity(id: data.id));
      }
    }
    await UserReminderAPI.deleteUserReminderListAPI(
            updateEntityList: updateEntityList)
        .then((value) {
      EasyLoading.showToast("全部删除成功");
      loadData();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
