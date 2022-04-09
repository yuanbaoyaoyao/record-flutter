import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'splash_state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();

  late final PageController pageController;

  late final List<String> splashList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    state.status = 1;

    splashList = ['splash_page_1', 'splash_page_2', 'splash_page_3'];

    pageController = PageController();
  }
}
