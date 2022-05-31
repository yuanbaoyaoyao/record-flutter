import 'package:get/get.dart';

class ApplicationsState {
  final _hasTypeContent = false.obs;
  final _hasModelContent = false.obs;
  final _hasNumberContent = false.obs;
  final _hasAddressContent = false.obs;

  set hasTypeContent(value) => _hasTypeContent.value = value;

  get hasTypeContent => _hasTypeContent.value;

  set hasModelContent(value) => _hasModelContent.value = value;

  get hasModelContent => _hasModelContent.value;

  set hasNumberContent(value) => _hasNumberContent.value = value;

  get hasNumberContent => _hasNumberContent.value;

  set hasAddressContent(value) => _hasAddressContent.value = value;

  get hasAddressContent => _hasAddressContent.value;
}
