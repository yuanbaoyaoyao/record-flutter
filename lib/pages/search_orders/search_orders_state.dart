import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../res/constant.dart';

class SearchOrdersState {
  final _hasOrdersHistory = false.obs;

  final List<String> _searchOrdersHistory =
      (SpUtil.getStringList(Constant.searchOrdersHistory)!).obs;

  final _onDeleteOrdersHistory = false.obs;

  set searchOrdersHistory(value) => _searchOrdersHistory;

  get searchOrdersHistory => _searchOrdersHistory;

  set hasOrdersHistory(value) => _hasOrdersHistory.value = value;

  get hasOrdersHistory => _hasOrdersHistory.value;

  set onDeleteOrdersHistory(value) => _onDeleteOrdersHistory.value = value;

  get onDeleteOrdersHistory => _onDeleteOrdersHistory.value;
}
