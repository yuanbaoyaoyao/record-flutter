import 'package:get/get.dart';

class CartState {
  final _isEditing = false.obs;

  set isEditing(value) => _isEditing.value = value;

  get isEditing => _isEditing.value;
}
