import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:record_flutter/res/constant.dart';
import 'package:sp_util/sp_util.dart';

import 'search_state.dart';

class SearchLogic extends GetxController {
  final SearchState state = SearchState();

  late final TextEditingController textSearchEditingController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initSearchHistory();
    textSearchEditingController = TextEditingController();
  }

  void initSearchHistory() {
    state.searchHistory = SpUtil.getStringList(Constant.searchHistory)!;
    state.hasHistory = false;
  }

  void putSearchHistory(inputSearchContent) {
    state.hasHistory = true;
    if (state.searchHistory[0] == "") {
      state.searchHistory[0] = inputSearchContent;
      SpUtil.putStringList(Constant.searchHistory, state.searchHistory);
    } else {
      //判断是否已存在
      if (state.searchHistory.contains(inputSearchContent)) {
        state.searchHistory.remove(inputSearchContent);
        state.searchHistory.insert(0, inputSearchContent);
      } else {
        if (state.searchHistory.length == 20) {
          state.searchHistory.remove(state.searchHistory[0]);
          state.searchHistory.insert(0, inputSearchContent);
        }
        state.searchHistory.insert(0, inputSearchContent);
      }
      SpUtil.putStringList(Constant.searchHistory, state.searchHistory);
    }
  }

  void clearSearchHistory() {
    SpUtil.remove(Constant.searchHistory);
    state.searchHistory.clear();
    state.searchHistory.insert(0, "");
    state.hasHistory = false;
  }
}
