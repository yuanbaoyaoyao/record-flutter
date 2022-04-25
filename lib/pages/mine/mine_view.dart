import 'package:flutter/cupertino.dart';
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
                child: Container(
              color: Colors.grey,
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
            ));
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

  Widget serviceWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(5),
          vertical: ScreenUtil().setHeight(5)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(5.0)),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                color: Colors.white),
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
          Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(5)),
                  color: Colors.white),
              height: ScreenUtil().setHeight(150),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: TextButton(
                            onPressed: () {
                              print("点击了待确认");
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.library_add_check_outlined,
                                  size: ScreenUtil().setWidth(20),
                                ),
                                Text(
                                  "待确认",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setWidth(12)),
                                )
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: TextButton(
                            onPressed: () {
                              print("点击了待确认");
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.library_add_check_outlined,
                                  size: ScreenUtil().setWidth(20),
                                ),
                                Text(
                                  "待确认",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setWidth(12)),
                                )
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: TextButton(
                            onPressed: () {
                              print("点击了待确认");
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.library_add_check_outlined,
                                  size: ScreenUtil().setWidth(20),
                                ),
                                Text(
                                  "待确认",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setWidth(12)),
                                )
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: TextButton(
                            onPressed: () {
                              print("点击了待确认");
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.library_add_check_outlined,
                                  size: ScreenUtil().setWidth(20),
                                ),
                                Text(
                                  "待确认",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setWidth(12)),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextButton(
                            onPressed: () {
                              print("点击了待确认");
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.library_add_check_outlined,
                                  size: ScreenUtil().setWidth(20),
                                ),
                                Text(
                                  "待确认",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setWidth(12)),
                                )
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextButton(
                            onPressed: () {
                              print("点击了待确认");
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.library_add_check_outlined,
                                  size: ScreenUtil().setWidth(20),
                                ),
                                Text(
                                  "待确认",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setWidth(12)),
                                )
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextButton(
                            onPressed: () {
                              print("点击了待确认");
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.library_add_check_outlined,
                                  size: ScreenUtil().setWidth(20),
                                ),
                                Text(
                                  "待确认",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setWidth(12)),
                                )
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextButton(
                            onPressed: () {
                              print("点击了待确认");
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.library_add_check_outlined,
                                  size: ScreenUtil().setWidth(20),
                                ),
                                Text(
                                  "待确认",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setWidth(12)),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget orderWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
      child: Column(
        children: [
          SizedBox(
              height: ScreenUtil().setHeight(40),
              child: Container(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(5.0)),
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(5)),
                    color: Colors.white),
                child: Row(
                  children: [
                    const Text(
                      "全部订单",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Expanded(child: Text("")),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shadowColor: MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        print("点击了查看全部订单");
                      },
                      child: Row(
                        children: const [
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
              )),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
                color: Colors.white),
            height: ScreenUtil().setHeight(80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        print("点击了待确认");
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.library_add_check_outlined,
                            size: ScreenUtil().setWidth(20),
                          ),
                          Text(
                            "待确认",
                            style:
                                TextStyle(fontSize: ScreenUtil().setWidth(12)),
                          )
                        ],
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        print("点击了待确认");
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.library_add_check_outlined,
                            size: ScreenUtil().setWidth(20),
                          ),
                          Text(
                            "待确认",
                            style:
                                TextStyle(fontSize: ScreenUtil().setWidth(12)),
                          )
                        ],
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        print("点击了待确认");
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.library_add_check_outlined,
                            size: ScreenUtil().setWidth(20),
                          ),
                          Text(
                            "待确认",
                            style:
                                TextStyle(fontSize: ScreenUtil().setWidth(12)),
                          )
                        ],
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        print("点击了待确认");
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.library_add_check_outlined,
                            size: ScreenUtil().setWidth(20),
                          ),
                          Text(
                            "待确认",
                            style:
                                TextStyle(fontSize: ScreenUtil().setWidth(12)),
                          )
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
