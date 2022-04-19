import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

Widget buildHomeSwiper() {
  return Swiper(
    itemBuilder: (BuildContext context, int index) {
      return Image.asset(
        "assets/images/mock/88a${index + 1}.png",
        fit: BoxFit.fill,
      );
    },
    autoplay: true,
    itemCount: 5,
    pagination: const SwiperPagination(
      builder: DotSwiperPaginationBuilder(
        color: Colors.blueGrey,
        activeColor: Colors.blue,
      ),
      margin: EdgeInsets.all(50.0),
    ),
    controller: SwiperController(),
    onTap: (index) {
      print("点击了第${index}个");
    },
  );
}

