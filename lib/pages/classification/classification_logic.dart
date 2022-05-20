import 'package:get/get.dart';

import 'classification_state.dart';

class ClassificationLogic extends GetxController {
  final ClassificationState state = ClassificationState();

  void initNavButtonCount(int count) {
    state.navButtonCount = count;
  }

  void initNavActive(int count) {
    for (int i = 0; i < count; i++) {
      state.navActive.add(false);
    }
  }

  void clearNavActive() {
    for (int i = 0; i < state.navActive.length; i++) {
      if (state.navActive[i] == true) {
        state.navActive[i] = false;
        break;
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initNavActive(16);
    initNavButtonCount(16);
    super.onInit();
  }
}
