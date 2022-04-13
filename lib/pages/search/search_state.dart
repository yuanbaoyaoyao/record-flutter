import 'package:get/get.dart';

class SearchState {
  final _hasHistory = false.obs;

  final List<String> _searchHistory = [""].obs;

  set searchHistory(value) => _searchHistory;

  get searchHistory => _searchHistory;

  set hasHistory(value) => _hasHistory.value = value;

  get hasHistory => _hasHistory.value;
}
