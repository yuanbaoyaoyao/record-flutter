import 'package:get/get.dart';
import 'package:record_flutter/res/constant.dart';
import 'package:sp_util/sp_util.dart';

class SearchState {
  final _hasHistory = false.obs;

  final List<String> _searchHistory =
      (SpUtil.getStringList(Constant.searchHistory)!).obs;

  final _onDeleteHistory = false.obs;

  set searchHistory(value) => _searchHistory;

  get searchHistory => _searchHistory;

  set hasHistory(value) => _hasHistory.value = value;

  get hasHistory => _hasHistory.value;

  set onDeleteHistory(value) => _onDeleteHistory.value = value;

  get onDeleteHistory => _onDeleteHistory.value;
}
