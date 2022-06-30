import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/user_feedback_api.dart';
import 'package:sp_util/sp_util.dart';

import '../../../../common/constant/user_constant.dart';
import 'feedback_state.dart';

class FeedbackLogic extends GetxController {
  final FeedbackState state = FeedbackState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  void loadData() {
    getFeedbacks();
  }

  void getFeedbacks() async {
    await UserFeedbackAPI.listUserFeedbackAPI(
            pageSize: state.pageSize,
            pageNum: 1,
            userId: SpUtil.getInt(UserConstant.userId))
        .then((value) {
      state.message = value.data.records;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
}
