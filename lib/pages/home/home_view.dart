import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/widgets/appBar.dart';
import 'package:record_flutter/pages/home/widgets/home_classification.dart';
import 'package:record_flutter/pages/home/widgets/home_new_old.dart';
import 'package:record_flutter/pages/home/widgets/home_swiper.dart';

import 'home_logic.dart';

class HomePage extends GetView<HomeLogic> {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: () => Column(
            children: [
              SizedBox(height: 200, child: buildHomeSwiper()),
              buildHomeClassification(
                context: context,
                state: state,
                logic: logic,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNewOld(
                    textTitle: "旧耗材",
                    testDescription: "描述",
                    onTapInfo: "剩余:8个",
                  ),
                  buildNewOld(
                    textTitle: "新耗材",
                    testDescription: "描述",
                    onTapInfo: "剩余:8个",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _buildListTextButton(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.music_note),
                          Text("为你推荐"),
                          Icon(Icons.music_note),
                        ],
                      ),
                      width: 180.0,
                    ),
                    Column(
                      children: _buildRecommendList(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildRecommendList() => List.generate(8, (index) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed("/consumables_detail");
          },
          child: Card(
              child: Container(
                width: ScreenUtil().screenWidth / 2.2,
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/mock/88a1.png"),
                    Text("这是标题"),
                    Text("这是描述"),
                    Row(
                      children: [
                        const Text(
                          "这是剩余数量",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Expanded(child: Text("")),
                        IconButton(
                            onPressed: () {
                              print("点击了添加按钮");
                            },
                            icon: Icon(Icons.add_circle_outline)),
                      ],
                    )
                  ],
                ),
              )),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed("/consumables_detail");
          },
          child: Card(
              child: Container(
                width: ScreenUtil().screenWidth / 2.2,
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/mock/88a1.png"),
                    Text("这是标题"),
                    Text("这是描述"),
                    Row(
                      children: [
                        Text(
                          "这是剩余数量",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Expanded(child: Text("")),
                        IconButton(
                            onPressed: () {
                              print("点击了添加按钮");
                            },
                            icon: Icon(Icons.add_circle_outline)),
                      ],
                    )
                  ],
                ),
              )),
        )
      ],
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
