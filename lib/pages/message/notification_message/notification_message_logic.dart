import 'package:get/get.dart';

import '../../../common/apis/announcement_api.dart';
import 'notification_message_state.dart';

class NotificationMessageLogic extends GetxController {
  final NotificationMessageState state = NotificationMessageState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  void loadData() {
    handleGetAnnouncement();
  }

  void handleGetAnnouncement() async {
    await AnnouncementAPI.listAnnouncementAPI().then((value) {
      state.announcement = value.data;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
