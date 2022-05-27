import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
