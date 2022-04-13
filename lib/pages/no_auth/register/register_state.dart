import 'package:get/get.dart';

class RegisterState {
  final _hasNameContent = false.obs;
  final _hasAccountContent = false.obs;
  final _hasPassWordContent = false.obs;

  set hasAccountContent(value) => _hasAccountContent.value = value;

  get hasAccountContent => _hasAccountContent.value;

  set hasNameContent(value) => _hasNameContent.value = value;

  get hasNameContent => _hasNameContent.value;

  set hasPassWordContent(value) => _hasPassWordContent.value = value;

  get hasPassWordContent => _hasPassWordContent.value;
}
