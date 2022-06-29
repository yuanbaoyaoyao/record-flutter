import 'package:get/get.dart';

class PasswordManagementState {
  final _hasEmailContent = false.obs;
  final _hasEmailCodeContent = false.obs;
  final _hasPasswordContent = false.obs;
  final _hasPasswordConfirmContent = false.obs;

  final _countDown = 0.obs;

  set countDown(value) => _countDown.value = value;

  get countDown => _countDown.value;

  set hasEmailContent(value) => _hasEmailContent.value = value;

  get hasEmailContent => _hasEmailContent.value;

  set hasEmailCodeContent(value) => _hasEmailCodeContent.value = value;

  get hasEmailCodeContent => _hasEmailCodeContent.value;

  set hasPasswordContent(value) => _hasPasswordContent.value = value;

  get hasPasswordContent => _hasPasswordContent.value;

  set hasPasswordConfirmContent(value) =>
      _hasPasswordConfirmContent.value = value;

  get hasPasswordConfirmContent => _hasPasswordConfirmContent.value;
}
