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
          builder: (context, child) {
            return Obx(() {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
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
                                state.status == 1
                                    ? Text("审核中")
                                    : state.status == 2
                                        ? Text("待收货")
                                        : state.status == 3
                                            ? Text("待评价")
                                            : state.status == 4
                                                ? Text("已结束")
                                                : state.status == 0
                                                    ? Text("已驳回")
                                                    : Text("已取消"),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                        child: Column(
                      children: [
                        Text(state.status.toString()),
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
                          children: state.orderProductList.length > 0
                              ? _buildListOrderConsumables()
                              : [const Text("")],
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
                                  child: Flexible(
                                child: Text(state.address),
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
                                      Text(state.orderSn),
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
                                  child: Flexible(
                                child: Text(state.createdAt),
                              ))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            });
          },
        ));
  }
}

final logic = Get.find<OrderDetailLogic>();
final state = Get.find<OrderDetailLogic>().state;

List<Widget> _buildListOrderConsumables() =>
    List.generate(state.orderProductList.length, (index) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5.0)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(5.0)),
                    child: Image.network(
                      state.orderProductList[index].productPicUrl,
                      width: ScreenUtil().setWidth(100.0),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Flexible(
                      child: Container(
                    color: Colors.pinkAccent,
                    height: ScreenUtil().setHeight(50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.orderProductList[index].productTitle),
                            Text(
                                state.orderProductList[index].productSkusTitle),
                          ],
                        ),
                        Text("共${state.orderProductList[index].number}个"),
                      ],
                    ),
                  ))
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    // TextButton(
                    //   onPressed: () {},
                    //   child: Text("申请售后"),
                    //   style: ButtonStyle(
                    //       shape: MaterialStateProperty.all(
                    //           RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                   ScreenUtil().setWidth(10.0)))),
                    //       side: MaterialStateProperty.all(
                    //           const BorderSide(color: Colors.grey)),
                    //       backgroundColor:
                    //           MaterialStateProperty.all(Colors.transparent)),
                    // )
                  ],
                ),
              )
            ],
          ));
    });
