import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_logic.dart';

class SplashPage extends GetView<SplashLogic> {
  Widget swiperBuilder(BuildContext context, int index) {
    return (Image.asset("assets/images/splash/splash_page_${index + 1}.png"));
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SplashLogic>();
    final state = Get.find<SplashLogic>().state;
    return Obx(() {
      return Material(
        child: state.status == 0
            ? FractionallySizedBox(
                // child: Image.asset("assets/images/logo.png"))
                child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(bottom: (20.0)),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 200.0,
                    )))
            : Swiper(
                itemCount: controller.splashList.length,
                itemBuilder: swiperBuilder,
                loop: false,
                onTap: (index) {
                  if (index == controller.splashList.length - 1) {
                    Get.offNamed('/login');
                  }
                }),
      );
    });
  }
}
