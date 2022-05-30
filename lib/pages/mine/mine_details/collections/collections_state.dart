import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CollectionsState {
  GlobalKey collectionKey = GlobalKey();

  final _isEditing = false.obs;

  set isEditing(value) => _isEditing.value = value;

  get isEditing => _isEditing.value;
}
