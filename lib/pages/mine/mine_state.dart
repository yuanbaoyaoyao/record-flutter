
import 'package:get/get.dart';

class MineState {
  final _userAvatar = "".obs;

  final _userName = "".obs;

  final _recommendList = [].obs;

  final _pageSize = 8.obs;

  set recommendList(value) => _recommendList.value = value;

  get recommendList => _recommendList;

  set userName(value) => _userName.value = value;

  get userName => _userName.value;

  set userAvatar(value) => _userAvatar.value = value;

  get userAvatar => _userAvatar.value;

  set pageSize(value) => _pageSize.value = value;

  get pageSize => _pageSize.value;
}
