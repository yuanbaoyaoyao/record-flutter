import 'package:get/get.dart';

import 'consumables_detail_state.dart';

class ConsumablesDetailLogic extends GetxController {
  final Consumables_detailState state = Consumables_detailState();

  void printHeight() {
    print("123:${state.statusHeight}");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    printHeight();
    super.onInit();
  }
}
