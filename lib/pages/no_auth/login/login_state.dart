import 'package:get/get.dart';

class LoginState {
  ///Initialize variables
  final _hasAccountContent = false.obs;
  final _hasPassWordContent = false.obs;

  set hasAccountContent(value) => _hasAccountContent.value = value;

  get hasAccountContent => _hasAccountContent.value;

  set hasPassWordContent(value) => _hasPassWordContent.value = value;

  get hasPassWordContent => _hasPassWordContent.value;
}
