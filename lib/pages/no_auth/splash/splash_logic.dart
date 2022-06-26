import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/apis/user_api.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/pages/no_auth/login/login_logic.dart';
import 'package:sp_util/sp_util.dart';

import '../../../res/constant.dart';
import 'splash_state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();

  late final PageController pageController;

  late final List<String> splashList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    splashList = ['splash_page_1', 'splash_page_2', 'splash_page_3'];

    pageController = PageController();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await SpUtil.getInstance();
      initSplash();
    });
  }

  void initSplash() {
    Timer(const Duration(milliseconds: 1500), () {
      if (SpUtil.getBool(Constant.firstStart, defValue: true)!) {
        SpUtil.putBool(Constant.firstStart, false);
        state.status = 1;
      } else {
        if (SpUtil.getBool(UserConstant.isLogin) == true) {
          Get.offNamed("/application");
          UserAPI.getUserInfo();
        } else {
          Get.offNamed("/login");
        }
      }
    });
  }
}
