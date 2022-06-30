
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record_flutter/common/apis/user_feedback_api.dart';
import 'package:record_flutter/common/apis/user_feedback_detail_api.dart';
import 'package:record_flutter/common/entities/user_feedback_detail_entity.dart';
import 'package:record_flutter/common/entities/user_feedback_entity.dart';
import 'package:record_flutter/pages/mine/mine_details/feedback/feedback_logic.dart';

import 'feedback_detail_state.dart';

class FeedbackDetailLogic extends GetxController {
  final FeedbackDetailState state = FeedbackDetailState();
  final feedbackLogic = Get.find<FeedbackLogic>();

  final ImagePicker imagePicker = ImagePicker();

  late final TextEditingController titleEditingController;

  late final TextEditingController descriptionEditingController;
  late final TextEditingController inputEditingController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    titleEditingController = TextEditingController();
    descriptionEditingController = TextEditingController();
    inputEditingController = TextEditingController();
    var data = Get.parameters;
    if (data['isNew'] == "true") {
      state.isNew = true;
    } else {
      int id = int.parse(data['id']!);
      state.feedbackPicUrl = data['feedbackPicUrl'];
      titleEditingController.text = data['feedbackTitle']!;
      descriptionEditingController.text = data['feedbackContent']!;
      if (data['isFinished'] == "true") {
        state.isFinished = true;
      }
      getInfo(id);
    }
  }

  void getInfo(int id) async {
    await UserFeedbackDetailAPI.listUserFeedbackDetailAPI(userFeedbackId: id)
        .then((value) {
      state.detailInfo = value;
      state.detailInfoLength = value.data.length;
      for (var data in state.detailInfo.data) {
        data.adminUserName ??= "";
      }
    });
  }

  void handleAddFeedbackDetail() async {
    var data = Get.parameters;
    int id = int.parse(data['id']!);
    await UserFeedbackDetailAPI.createUserFeedbackDetailAPI(
            updateEntity: UserFeedbackDetailUpdateEntity(
                userFeedbackId: id, content: inputEditingController.text))
        .then((value) {
      EasyLoading.showToast("发送消息成功");
      inputEditingController.clear();
      getInfo(id);
    });
  }

  void handleCloseFeedback() async {
    var data = Get.parameters;
    int id = int.parse(data['id']!);
    await UserFeedbackAPI.updateUserFeedbackFinishedAPI(
            updateEntity: UserFeedbackUpdateEntity(id: id))
        .then((value) {
      feedbackLogic.loadData();
      Get.back();
      EasyLoading.showToast("结束反馈成功");
    });
  }

  Future handleGetImage(BuildContext context) async {
    late XFile? image;
    if (state.isGallery == true) {
      image = await imagePicker.pickImage(source: ImageSource.gallery);
      state.isGallery = false;
    } else if (state.isCamera == true) {
      image = await imagePicker.pickImage(source: ImageSource.camera);
      state.isGallery = false;
    }
    if (image != null) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleEditingController.dispose();
    descriptionEditingController.dispose();
    inputEditingController.dispose();
  }
}
