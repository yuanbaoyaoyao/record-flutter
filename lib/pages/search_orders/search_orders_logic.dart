import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../res/constant.dart';
import 'search_orders_state.dart';

class SearchOrdersLogic extends GetxController {
  final SearchOrdersState state = SearchOrdersState();

  late final TextEditingController textSearchOrdersEditingController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initSearchOrdersHistory();
    textSearchOrdersEditingController = TextEditingController();
  }

  void initSearchOrdersHistory() {
    state.searchOrdersHistory = SpUtil.getStringList(Constant.searchOrdersHistory)!;
    if (state.searchOrdersHistory.length == 0) {
      state.searchOrdersHistory.insert(0, "");
    }
    print("初始化initSearchOrdersHistory:${state.searchOrdersHistory}");
    if (state.searchOrdersHistory[0] == "") {
      state.hasOrdersHistory = false;
    } else {
      state.hasOrdersHistory = true;
    }
  }

  void putSearchOrdersHistory(inputSearchContent) {
    state.hasOrdersHistory = true;
    if (state.searchOrdersHistory[0] == "") {
      state.searchOrdersHistory[0] = inputSearchContent;
      SpUtil.putStringList(Constant.searchOrdersHistory, state.searchOrdersHistory);
    } else {
      //判断是否已存在
      if (state.searchOrdersHistory.contains(inputSearchContent)) {
        state.searchOrdersHistory.remove(inputSearchContent);
        state.searchOrdersHistory.insert(0, inputSearchContent);
      } else {
        if (state.searchOrdersHistory.length == 20) {
          state.searchOrdersHistory.remove(state.searchOrdersHistory[0]);
          state.searchOrdersHistory.insert(0, inputSearchContent);
        }
        state.searchOrdersHistory.insert(0, inputSearchContent);
      }
      SpUtil.putStringList(Constant.searchOrdersHistory, state.searchOrdersHistory);
    }
  }

  void deleteOneSearchOrdersHistory(oneSearchOrdersHistory) {
    state.searchOrdersHistory.remove(oneSearchOrdersHistory);
    SpUtil.putStringList(Constant.searchOrdersHistory, state.searchOrdersHistory);
  }

  void clearSearchOrdersHistory() {
    SpUtil.remove(Constant.searchOrdersHistory);
    state.searchOrdersHistory.clear();
    state.searchOrdersHistory.insert(0, "");
    state.hasOrdersHistory = false;
  }
}
