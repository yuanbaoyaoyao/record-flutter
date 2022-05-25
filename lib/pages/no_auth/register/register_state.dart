import 'package:get/get.dart';

class RegisterState {
  final _hasNameContent = false.obs;
  final _hasEmailContent = false.obs;
  final _hasEmailCodeContent = false.obs;
  final _hasTapSendEmailButton = false.obs;
  final _hasPassWordContent = false.obs;

  final _countDown = 0.obs;

  set countDown(value) => _countDown.value = value;

  get countDown => _countDown.value;

  set hasEmailContent(value) => _hasEmailContent.value = value;

  get hasEmailContent => _hasEmailContent.value;

  set hasEmailCodeContent(value) => _hasEmailCodeContent.value = value;

  get hasEmailCodeContent => _hasEmailCodeContent.value;

  set hasTapSendEmailButton(value) => _hasTapSendEmailButton.value = value;

  get hasTapSendEmailButton => _hasTapSendEmailButton.value;

  set hasNameContent(value) => _hasNameContent.value = value;

  get hasNameContent => _hasNameContent.value;

  set hasPassWordContent(value) => _hasPassWordContent.value = value;

  get hasPassWordContent => _hasPassWordContent.value;
}
