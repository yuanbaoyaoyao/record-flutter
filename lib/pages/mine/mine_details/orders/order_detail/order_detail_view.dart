import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:record_flutter/res/constant.dart';

import 'order_detail_logic.dart';

class OrderDetailPage extends StatelessWidget {
  final logic = Get.find<OrderDetailLogic>();
  final state = Get.find<OrderDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("订单详情"),
          centerTitle: true,
        ),
        body: ScreenUtilInit(
          builder: (context , child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.redAccent,
                          child: Container(
                            margin: EdgeInsets.all(ScreenUtil().setWidth(10.0)),
                            padding:
                                EdgeInsets.all(ScreenUtil().setWidth(10.0)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(
                                    ScreenUtil().setWidth(5.0)))),
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(Icons.info),
                                  margin: EdgeInsets.only(
                                      right: ScreenUtil().setWidth(5.0)),
                                ),
                                Text("这是订单状态")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: Column(
                    children: [
                      Container(
                        child: const Text(
                          "订单物品",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: Colors.green,
                        width: ScreenUtil().screenWidth,
                        padding: EdgeInsets.all(ScreenUtil().setWidth(10.0)),
                      ),
                      Column(
                        children: _buildListOrderConsumables(),
                      ),
                    ],
                  )),
                  Column(
                    children: [
                      Container(
                        child: const Text(
                          "订单信息",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: Colors.green,
                        width: ScreenUtil().screenWidth,
                        padding: EdgeInsets.all(ScreenUtil().setWidth(10.0)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(5.0)),
                        child: Row(
                          children: [
                            SizedBox(
                              child: Text("收货地址:"),
                              width: ScreenUtil().screenWidth / 6,
                            ),
                            SizedBox(
                              width: ScreenUtil().screenWidth / 6,
                            ),
                            Container(
                                child: const Flexible(
                              child: Text(
                                  "元宝,86-18976558930,天津市武清区泉州路17号天津红日药业股份有限公司"),
                            ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(5.0)),
                        child: Row(
                          children: [
                            SizedBox(
                              child: Text("订单号:"),
                              width: ScreenUtil().screenWidth / 6,
                            ),
                            SizedBox(
                              width: ScreenUtil().screenWidth / 6,
                            ),
                            Container(
                                width: ScreenUtil().screenWidth * (2 / 3),
                                child: Row(
                                  children: [
                                    Text("23465547658768567657"),
                                    Expanded(child: Text("")),
                                    TextButton(
                                        onPressed: () {}, child: Text("复制"))
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(5.0)),
                        child: Row(
                          children: [
                            SizedBox(
                              child: Text("下单时间:"),
                              width: ScreenUtil().screenWidth / 6,
                            ),
                            SizedBox(
                              width: ScreenUtil().screenWidth / 6,
                            ),
                            Container(
                                child: const Flexible(
                                  child: Text(
                                      "2022-05-29 10：32：04"),
                                ))
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }
}

List<Widget> _buildListOrderConsumables() => List.generate(6, (index) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5.0)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(2.0)),
                    child: Image.asset(
                      "assets/images/mock/88a1.png",
                      width: ScreenUtil().setWidth(100.0),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("这是标题"),
                        Text("这是描述"),
                        Text("这是数量"),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("申请售后"),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(10.0)))),
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.grey)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent)),
                    )
                  ],
                ),
              )
            ],
          ));
    });
