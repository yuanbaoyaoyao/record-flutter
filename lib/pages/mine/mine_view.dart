import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'mine_logic.dart';

class MinePage extends StatelessWidget {
  final logic = Get.find<MineLogic>();
  final state = Get.find<MineLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  print("点击了搜索按钮");
                  Get.toNamed("/search");
                },
                icon: Icon(Icons.search_outlined)),
            IconButton(
                onPressed: () {
                  print("点击了设置按钮");
                  Get.toNamed("/setting");
                },
                icon: Icon(Icons.settings)),
            IconButton(
                onPressed: () {
                  print("点击了消息盒子");
                  Get.toNamed("/message_box");
                },
                icon: Icon(Icons.mail_outline)),
          ],
        ),
        body: ScreenUtilInit(
          builder: () {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/dingding.png",
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const Text("这是名称")
                      ],
                    ),
                  ),
                  orderWidget(),
                  serviceWidget(),
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
            );
          },
        ));
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

  Widget serviceWidget() {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(40),
            child: Row(
              children: [
                Text(
                  "我的服务",
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(160),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 40,
              crossAxisCount: 4,
              children: [
                TextButton(
                  onPressed: () {
                    print("点击了待确认");
                  },
                  child: Column(
                    children: [
                      Icon(Icons.library_add_check_outlined),
                      Text("待确认")
                    ],
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      print("点击了待收货");
                    },
                    child: Column(
                      children: [Icon(Icons.all_inbox), Text("待收货")],
                    )),
                TextButton(
                    onPressed: () {
                      print("点击了待评价");
                    },
                    child: Column(
                      children: [Icon(Icons.message), Text("待评价")],
                    )),
                TextButton(
                    onPressed: () {
                      print("点击了退换货");
                    },
                    child: Column(
                      children: [
                        Icon(Icons.precision_manufacturing_rounded),
                        Text("退换货")
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      print("点击了待确认");
                    },
                    child: Column(
                      children: [
                        Icon(Icons.library_add_check_outlined),
                        Text("待确认")
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      print("点击了待收货");
                    },
                    child: Column(
                      children: [Icon(Icons.all_inbox), Text("待收货")],
                    )),
                TextButton(
                    onPressed: () {
                      print("点击了待评价");
                    },
                    child: Column(
                      children: [Icon(Icons.message), Text("待评价")],
                    )),
                TextButton(
                    onPressed: () {
                      print("点击了退换货");
                    },
                    child: Column(
                      children: [
                        Icon(Icons.precision_manufacturing_rounded),
                        Text("退换货")
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget orderWidget() {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(40),
            child: Row(
              children: [
                Text(
                  "全部订单",
                  style: TextStyle(fontSize: 20.0),
                ),
                Expanded(child: Text("")),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shadowColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    print("点击了查看全部订单");
                  },
                  child: Row(
                    children: [
                      Text(
                        "查看全部订单",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(100),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 40,
              children: [
                TextButton(
                    onPressed: () {
                      print("点击了待确认");
                    },
                    child: Column(
                      children: [
                        Icon(Icons.library_add_check_outlined),
                        Text("待确认")
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      print("点击了待收货");
                    },
                    child: Column(
                      children: [Icon(Icons.all_inbox), Text("待收货")],
                    )),
                TextButton(
                    onPressed: () {
                      print("点击了待评价");
                    },
                    child: Column(
                      children: [Icon(Icons.message), Text("待评价")],
                    )),
                TextButton(
                    onPressed: () {
                      print("点击了退换货");
                    },
                    child: Column(
                      children: [
                        Icon(Icons.precision_manufacturing_rounded),
                        Text("退换货")
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
