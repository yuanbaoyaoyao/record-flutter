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
            builder: () => Container(
                color: Colors.grey,
                child: Column(
                  children: [
                    SizedBox(
                        height: ScreenUtil().setHeight(200),
                        child: buildHomeSwiper()),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                      child: buildHomeClassification(
                        context: context,
                        state: state,
                        logic: logic,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                      child: Row(
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _buildListTextButton(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: _buildRecommendList(),
                      ),
                    )
                  ],
                ))),
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
                width: ScreenUtil().screenWidth / 2.1,
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
                width: ScreenUtil().screenWidth / 2.1,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("第${index + 1}button"),
              Text("button简介"),
            ],
          ),
        );
      });
}
