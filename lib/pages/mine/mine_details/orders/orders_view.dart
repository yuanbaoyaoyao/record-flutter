import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:record_flutter/pages/mine/mine_details/orders/widgets/order_appbar.dart';

import 'orders_logic.dart';

class OrdersPage extends StatelessWidget {
  final logic = Get.find<OrdersLogic>();
  final state = Get.find<OrdersLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildOrdersAppBar(),
        body: ScreenUtilInit(
          builder: (context , child) {
            return Container(
                color: Colors.grey,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) => Container(
                            color: Colors.white,
                            padding:
                                EdgeInsets.all(ScreenUtil().setWidth(10.0)),
                            margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(5.0)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("2022-05-28 09:53:13"),
                                    Expanded(child: Text("")),
                                    Text("这是状态"),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: ScreenUtil().setHeight(5.0)),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  child: GestureDetector(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              ScreenUtil().setHeight(10.0)),
                                      child: Row(
                                        children: [
                                          Text("这是图片"),
                                          Expanded(child: Text("")),
                                          Text("这是总件数"),
                                          Icon(Icons.chevron_right)
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Get.toNamed("/order_detail");
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0)))),
                                        onPressed: () {
                                          print("点击了button1");
                                        },
                                        child: Text("再次购买"))
                                  ],
                                )
                              ],
                            ),
                          )),
                ));
          },
        ));
  }
}
