import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:image/image.dart';
import 'package:record_flutter/router/app_pages.dart';

import 'splash_logic.dart';

class SplashPage extends GetView<SplashLogic> {
  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.asset("assets/images/splash/splash_page_1.png"));
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SplashLogic>();
    final state = Get.find<SplashLogic>().state;

    // return Scaffold(
    //   body: GestureDetector(
    //     onTap: () => Get.offAndToNamed(AppRoutes.Login),
    //     child: const Center(
    //       child: Text("这是欢迎页"),
    //
    //     ),
    //   ),
    // );
    return Material(
      child: Swiper(
          //用下划线会报错，暂时未知原因
          itemCount: controller.splashList.length,
          // itemBuilder: (_, index) {
          // },
          itemBuilder: _swiperBuilder,
          onTap: (index) {
            // print("这是$index");
            if (index == controller.splashList.length - 1) {
              Get.offNamed('/login');
            }
          }),
    );
  }
}
