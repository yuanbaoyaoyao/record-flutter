import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        IconButton(
            onPressed: () {
              print("点击了收藏按钮");
            },
            icon: Icon(Icons.star_border)),
        IconButton(
            onPressed: () {
              print("点击了购物车按钮");
            },
            icon: Icon(Icons.shopping_cart)),
        Expanded(child: Text("")),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.green,
          ),
          child: TextButton(
              onPressed: () {
                print("点击了加入购物车");
              },
              child: Text("加入购物车")),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.green,
          ),
          child: TextButton(
              onPressed: () {
                print("点击了立即购买");
              },
              child: Text("立即购买")),
        ),
      ],
    ));
  }
}
