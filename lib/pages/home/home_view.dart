import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                "assets/images/mock/88a${index + 1}.png",
                fit: BoxFit.fill,
              );
            },
            autoplay: true,
            itemCount: 5,
            pagination: const SwiperPagination(),
            controller: SwiperController(),
            onTap: (index) {
              print("点击了第${index}个");
            },
          ),
        ),
        const Text("123")
      ],
    );
  }
}
