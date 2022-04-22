import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'widgets/custom_bottom_nav_bar.dart';

import 'cart_logic.dart';

class CartPage extends StatelessWidget {
  final logic = Get.find<CartLogic>();
  final state = Get.find<CartLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("购物车"),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                print("点击了编辑按钮");
              },
              child: const Text(
                "编辑",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Column(
            children: _buildListCartItem(),
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
                  children: _buildListrecommendList(),
                )
              ],
            ),
          )
        ],
      )),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  List<Widget> _buildListrecommendList() => List.generate(8, (index) {
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

  List<Widget> _buildListCartItem() => List.generate(4, (index) {
        return Container(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                    onPressed: () {
                      print("点击了选中按钮");
                    },
                    icon: const Icon(Icons.check_circle_outline)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.asset(
                  "assets/images/mock/88a1.png",
                  width: 80.0,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("这是标题"),
                      Row(
                        children: [
                          Text("这是剩余数量"),
                          const Expanded(child: Text("")),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    print("点击了减少按钮");
                                  },
                                  icon:
                                      const Icon(Icons.remove_circle_outline)),
                              Text("1"),
                              IconButton(
                                  onPressed: () {
                                    print("点击了减少按钮");
                                  },
                                  icon: const Icon(Icons.add_circle_outline)),
                            ],
                          )
                        ],
                      )
                    ]),
              ),
            ],
          ),
        );
      });
}
