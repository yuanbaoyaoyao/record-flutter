import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../cart_logic.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomBottomNavBarState();
  }
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final logic = Get.find<CartLogic>();
  final state = Get.find<CartLogic>().state;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Row(
      children: [
        Container(
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    print("点击了收藏按钮");
                  },
                  icon: Icon(Icons.check_circle_outline)),
              Text("全选"),
            ],
          ),
        ),
        Expanded(child: Text("")),
        Text("合计："),
        Text(
          "6",
          style: TextStyle(fontSize: 20.0),
        ),
        Text("件"),
        Obx(() {
          return Container(
            width: ScreenUtil().setWidth(80),
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: !state.isEditing ?Colors.red:Colors.grey,
            ),
            child: TextButton(
                onPressed: () {
                  print("点击了去结算");
                },
                child: !state.isEditing ? Text("去结算") : Text("删除")),
          );
        })
      ],
    ));
  }
}
