import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
                color: Colors.white),
            height: ScreenUtil().setHeight(80),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: TextButton(
                          onPressed: () {
                            print("点击了收藏");
                            Get.toNamed("/collections");
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.stars,
                                size: ScreenUtil().setWidth(20),
                              ),
                              Text(
                                "收藏",
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
                            print("点击了收货地址");
                            Get.toNamed("/address_management");
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.edit_location_outlined,
                                size: ScreenUtil().setWidth(20),
                              ),
                              Text(
                                "收货地址",
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
                            print("点击了我的反馈");
                            Get.toNamed("/feedback_message");
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.comment_outlined,
                                size: ScreenUtil().setWidth(20),
                              ),
                              Text(
                                "我的反馈",
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
                            print("点击了直接申请耗材");
                            Get.toNamed("/applications");
                          },
                          child: Column(
                            children: [
                              Icon(
                                FontAwesomeIcons.penToSquare,
                                size: ScreenUtil().setWidth(20),
                              ),
                              Text(
                                "直接申请",
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
