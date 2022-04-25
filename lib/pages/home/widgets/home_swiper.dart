import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget buildHomeSwiper() {
  return Container(
      width: ScreenUtil().screenWidth,
      margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(5), 0,
          ScreenUtil().setWidth(5), ScreenUtil().setWidth(5)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(ScreenUtil().setWidth(5))),
          color: Colors.white),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            "assets/images/mock/88a${index + 1}.png",
            fit: BoxFit.contain,
          );
        },
        autoplay: true,
        itemCount: 5,
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.blueGrey,
            activeColor: Colors.blue,
          ),
        ),
        controller: SwiperController(),
        onTap: (index) {
          print("点击了第${index}个");
          Get.toNamed("/consumables_detail");
        },
      ));
}
