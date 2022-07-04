import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:record_flutter/pages/cart/cart_logic.dart';
import 'package:record_flutter/pages/confirm_order/widgets/custom_bottom_nav_bar.dart';
import 'package:sp_util/sp_util.dart';

import '../../common/constant/user_constant.dart';
import 'confirm_order_logic.dart';

final logic = Get.find<ConfirmOrderLogic>();
final state = Get.find<ConfirmOrderLogic>().state;
final cartState = Get.find<CartLogic>().state;

class ConfirmOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("确认订单"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: Obx(() {
        return Column(
          children: [
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            height: ScreenUtil().setHeight(300.0),
                            color: Colors.amber,
                            child: Column(
                              children: [
                                Container(
                                  child: const Text(
                                    "选择地址",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  color: Colors.pinkAccent,
                                  alignment: Alignment.center,
                                  height: ScreenUtil().setHeight(50.0),
                                ),
                                Flexible(
                                  child: ListView.builder(
                                      itemCount: state.addressList.data.length,
                                      itemBuilder: (context, index) => InkWell(
                                            child: Container(
                                              margin: EdgeInsets.all(
                                                  ScreenUtil().setHeight(10.0)),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: ScreenUtil()
                                                            .setHeight(5.0)),
                                                    child: state
                                                                .addressList
                                                                .data[index]
                                                                .addressDetail ==
                                                            state.addressDetail
                                                        ? Icon(Icons.check)
                                                        : Icon(
                                                            Icons.location_on),
                                                  ),
                                                  Text(state
                                                      .addressList
                                                      .data[index]
                                                      .addressDetail)
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              Get.back();
                                              state.addressDetail = state
                                                  .addressList
                                                  .data[index]
                                                  .addressDetail;
                                              state.receiver = state.addressList
                                                  .data[index].receiver;
                                              state.phone = state.addressList
                                                  .data[index].phone;

                                              state.userOrder.userAddressId =
                                                  state.addressList.data[index]
                                                      .id;
                                              state.userOrder.receiver = state
                                                  .addressList
                                                  .data[index]
                                                  .receiver;
                                              state.userOrder.user = state
                                                  .addressList.data[index].user;
                                              state.userOrder.addressDetail =
                                                  state.addressList.data[index]
                                                      .addressDetail;
                                              log("state.userOrder:"+state.userOrder.toJson().toString());
                                            },
                                          )),
                                )
                              ],
                            ));
                      });
                },
                child: Container(
                    color: Colors.pinkAccent,
                    padding: EdgeInsets.all(ScreenUtil().setHeight(8.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        state.addressDetail != ""
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      state.addressDetail ==
                                              state.defaultAddressTemp
                                          ? Text(
                                              "默认  ",
                                              style: TextStyle(
                                                  backgroundColor:
                                                      Colors.redAccent),
                                            )
                                          : Text(""),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                ScreenUtil().setHeight(5.0)),
                                        child: Text(
                                          state.addressDetail,
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(state.receiver),
                                      Text("   "),
                                      Text(state.phone)
                                    ],
                                  )
                                ],
                              )
                            : Text("请选择地址"),
                        Icon(Icons.chevron_right)
                      ],
                    ))),
            Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(10.0)),
                child: Column(
                  children: _buildListOrderConsumables(),
                )),
            InkWell(
                onTap: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                          height: ScreenUtil().setHeight(500.0),
                          color: Colors.amber,
                          child: Column(
                            children: [
                              Container(
                                child: const Text(
                                  "订单备注",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                color: Colors.pinkAccent,
                                alignment: Alignment.center,
                                height: ScreenUtil().setHeight(50.0),
                              ),
                              TextField(
                                controller: logic.orderRemarksController,
                                maxLines: 3,
                                maxLength: 100,
                              ),
                              SizedBox(
                                width: ScreenUtil().screenWidth,
                                child: ElevatedButton(
                                  onPressed: () {
                                    state.orderRemarks =
                                        logic.orderRemarksController.text;
                                    state.userOrder.orderRemarks =
                                        logic.orderRemarksController.text;
                                    Get.back();
                                  },
                                  child: Text("确定"),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.deepOrange),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40))),
                                      elevation:
                                          MaterialStateProperty.all(0.0)),
                                ),
                              )
                            ],
                          ));
                    },
                  );
                },
                child: Container(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(10.0)),
                    child: Obx(() {
                      return Row(
                        children: [
                          Text("订单备注"),
                          Expanded(child: Text("")),
                          state.orderRemarks == ""
                              ? Text("无备注")
                              : Text(state.orderRemarks),
                          Icon(Icons.chevron_right)
                        ],
                      );
                    })))
          ],
        );
      })),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

List<Widget> _buildListOrderConsumables() =>
    List.generate(cartState.checkedCartItemList.length, (index) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5.0)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(2.0)),
                    child: Image.network(
                      cartState.checkedCartItemList[index].avatar,
                      width: ScreenUtil().setWidth(100.0),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                      width:
                          ScreenUtil().screenWidth - ScreenUtil().setWidth(120),
                      color: Colors.pinkAccent,
                      height: ScreenUtil().setHeight(60.0),
                      child: Row(
                        children: [
                          Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(cartState
                                  .checkedCartItemList[index].productName),
                              Text(cartState.checkedCartItemList[index].title),
                            ],
                          )),
                          const Expanded(child: Text("")),
                          Text(
                              "共${cartState.checkedCartItemList[index].productSkusNumber.toString()}个"),
                        ],
                      ))
                ],
              ),
            ],
          ));
    });
