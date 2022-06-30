import 'dart:ffi';

import 'package:get/get.dart';
import 'package:record_flutter/common/entities/user_feedback_detail_entity.dart';

class FeedbackDetailState {
  final _isGallery = false.obs;
  final _isCamera = false.obs;

  final _hasTitle = false.obs;
  final _hasContent = false.obs;

  final _isNew = false.obs;
  final _isFinished = false.obs;

  final _feedbackPicUrl = "".obs;

  final _detailInfo =
      UserFeedbackDetailEntity(code: null, message: null, data: null).obs;

  final _detailInfoLength = 0.obs;

  set detailInfo(value) => _detailInfo.value = value;

  get detailInfo => _detailInfo.value;

  set detailInfoLength(value) => _detailInfoLength.value = value;

  get detailInfoLength => _detailInfoLength.value;

  set feedbackPicUrl(value) => _feedbackPicUrl.value = value;

  get feedbackPicUrl => _feedbackPicUrl.value;

  set hasTitle(value) => _hasTitle.value = value;

  get hasTitle => _hasTitle.value;

  set hasContent(value) => _hasContent.value = value;

  get hasContent => _hasContent.value;

  set isGallery(value) => _isGallery.value = value;

  get isGallery => _isGallery.value;

  set isCamera(value) => _isCamera.value = value;

  get isCamera => _isCamera.value;

  set isNew(value) => _isNew.value = value;

  get isNew => _isNew.value;

  set isFinished(value) => _isFinished.value = value;

  get isFinished => _isFinished.value;
}
