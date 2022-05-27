import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
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
                      Get.toNamed("/orders");
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
                          style: TextStyle(fontSize: ScreenUtil().setWidth(12)),
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
                          FontAwesomeIcons.truckFieldUn,
                          size: ScreenUtil().setWidth(20),
                        ),
                        Text(
                          "待收货",
                          style: TextStyle(fontSize: ScreenUtil().setWidth(12)),
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
                          FontAwesomeIcons.commentDots,
                          size: ScreenUtil().setWidth(20),
                        ),
                        Text(
                          "待评价",
                          style: TextStyle(fontSize: ScreenUtil().setWidth(12)),
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
                          FontAwesomeIcons.rotate,
                          size: ScreenUtil().setWidth(20),
                        ),
                        Text(
                          "退换货",
                          style: TextStyle(fontSize: ScreenUtil().setWidth(12)),
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
