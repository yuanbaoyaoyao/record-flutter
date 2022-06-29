import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/announcement_api.dart';
import 'package:record_flutter/common/apis/user_reminder_api.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/common/entities/user_reminder_entity.dart';
import 'package:sp_util/sp_util.dart';

import 'message_box_state.dart';

class MessageBoxLogic extends GetxController {
  final MessageBoxState state = MessageBoxState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  void loadData() {
    handleGetReminders();
    handleGetAnnouncement();
  }

  void handleGetReminders() async {
    await UserReminderAPI.listUserReminderAPI(
            userId: SpUtil.getInt(UserConstant.userId))
        .then((value) {
      state.message = value.data;
      log("state.message:" + value.toJson().toString());
    });
  }

  void handleGetAnnouncement() async {
    await AnnouncementAPI.listAnnouncementAPI().then((value) {
      state.announcement = value.data;
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
      updateEntityList.add(UserReminderUpdateEntity(id: data.id));
    }
    await UserReminderAPI.deleteUserReminderListAPI(
            updateEntityList: updateEntityList)
        .then((value) {
      EasyLoading.showToast("全部删除成功");
      loadData();
    });
  }

  void handleUpdate() async {
    await UserReminderAPI.updateUserReminderAPI(
            updateEntity: state.onTapMessage)
        .then((value) {
      loadData();
    });
  }

  void handleUpdateList() async {
    List<UserReminderUpdateEntity> updateEntityList = [];
    for (var data in state.message) {
      updateEntityList.add(UserReminderUpdateEntity(id: data.id));
    }
    await UserReminderAPI.updateUserReminderListAPI(
            updateEntityList: updateEntityList)
        .then((value) {
      EasyLoading.showToast("全部已读成功");
      loadData();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
