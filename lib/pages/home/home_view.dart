import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends GetView<HomeLogic> {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => Column(
          children: [
            SizedBox(
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
              ),
            ),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: ScreenUtil().screenWidth,
                      margin: EdgeInsets.only(bottom: 0.0),
                      height: 130.0,
                      child: ListView(
                        controller: logic.scrollController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            children: [
                              Wrap(
                                children:
                                    _buildClassificationFirstFloorIconButton(),
                              ),
                              Wrap(
                                children:
                                    _buildClassificationSecondFloorIconButton(),
                              )
                            ],
                          )
                        ],
                        shrinkWrap: true,
                      ),
                    ),
                    Obx(() {
                      return Container(
                        margin: const EdgeInsets.all(0.0),
                        width: 5.0,
                        height: 15.0,
                        alignment: Alignment.topCenter,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 2.0),
                              inactiveTrackColor: Colors.grey),
                          child: Slider(
                              value: state.sliderValue,
                              max: state.sliderMaxValue,
                              onChanged: (value) {
                                print("$value");
                                state.sliderValue = value;
                              }),
                        ),
                      );
                    })
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  child: Container(
                      width: ScreenUtil().screenWidth * (0.47),
                      child: GestureDetector(
                        onTap: () {
                          print("点击了旧耗材");
                          Get.toNamed("/old_consumables");
                        },
                        child: Column(
                          children: [
                            Text("旧耗材"),
                            Text("描述"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/mock/88a1.png",
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.contain,
                                    ),
                                    Text("剩余:8个")
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/mock/88a1.png",
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.contain,
                                    ),
                                    Text("剩余:8个")
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
                Card(
                  child: Container(
                      width: ScreenUtil().screenWidth * (0.47),
                      child: GestureDetector(
                        onTap: () {
                          print("点击了新耗材");
                          Get.toNamed("/new_consumables");
                        },
                        child: Column(
                          children: [
                            Text("新耗材"),
                            Text("描述"),
                            // Text("图片"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/mock/88a1.png",
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.contain,
                                    ),
                                    Text("剩余:8个")
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/mock/88a1.png",
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.contain,
                                    ),
                                    Text("剩余:8个")
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildListTextButton(),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Text("123"),
                Text("123"),
                Text("123"),
                Text("123"),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildClassificationFirstFloorIconButton() =>
      List.generate(8, (index) {
        return InkWell(
          onTap: () {
            print("点击了图标");
          },
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 20.0,
              ),
              TextButton(
                  onPressed: () {
                    print("点击了分类");
                  },
                  child: Text("硒鼓"))
            ],
          ),
        );
      });

  List<Widget> _buildClassificationSecondFloorIconButton() =>
      List.generate(8, (index) {
        return InkWell(
          onTap: () {
            print("点击了图标");
          },
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 20.0,
              ),
              TextButton(
                  onPressed: () {
                    print("点击了分类");
                  },
                  child: Text("硒鼓"))
            ],
          ),
        );
      });

  List<Widget> _buildListTextButton() => List.generate(4, (index) {
        return InkWell(
          onTap: () {
            print("点击了图标$index");
            state.listPage = index;
          },
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    print("点击了分类");
                  },
                  child: Text("第${index + 1}button")),
              Text("button简介"),
            ],
          ),
        );
      });
}
