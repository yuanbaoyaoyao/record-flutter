import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:record_flutter/pages/mine/mine_details/collections/collections_logic.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomBottomNavBarState();
  }
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final logic = Get.find<CollectionsLogic>();
  final state = Get.find<CollectionsLogic>().state;

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
              //使用radio
              Text("全选"),
            ],
          ),
        ),
        Expanded(child: Text("")),
        Container(
          width: ScreenUtil().setWidth(80),
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.grey,
          ),
          child: TextButton(
              onPressed: () {
                print("点击了去结算");
              },
              child: Text("删除")),
        )
      ],
    ));
  }
}
