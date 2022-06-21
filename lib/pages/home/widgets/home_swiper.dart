import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../home_logic.dart';

Widget buildHomeSwiper() {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;
  return Container(
      width: ScreenUtil().screenWidth,
      margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(5), 0,
          ScreenUtil().setWidth(5), ScreenUtil().setWidth(5)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(ScreenUtil().setWidth(5))),
          color: Colors.white),
      child: Obx(() {
        return Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              state.rotations[index].avatar,
              fit: BoxFit.cover,
            );
          },
          autoplay: true,
          itemCount: state.rotations.length,
          // itemCount: 4,
          pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.blueGrey,
              activeColor: Colors.blue,
            ),
          ),
          controller: SwiperController(),
          onTap: (index) {
            log("点击了${state.rotations[index].avatar}");
            Get.toNamed("/consumables_detail");
          },
        );
      }));
}
