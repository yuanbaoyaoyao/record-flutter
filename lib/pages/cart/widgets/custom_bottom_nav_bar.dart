import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomBottomNavBarState();
  }
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
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
        Text("6",style: TextStyle(
          fontSize: 20.0
        ),),
        Text("件"),
        Container(
          width: ScreenUtil().setWidth(80),
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.red,
          ),
          child: TextButton(
              onPressed: () {
                print("点击了去结算");
              },
              child: Text("去结算")),
        ),
      ],
    ));
  }
}
