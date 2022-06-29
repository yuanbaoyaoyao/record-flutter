import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'address_management_details_logic.dart';

class AddressManagementDetailsPage extends StatelessWidget {
  final logic = Get.find<AddressManagementDetailsLogic>();
  final state = Get.find<AddressManagementDetailsLogic>().state;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("编辑收货地址"),
          centerTitle: true,
          actions: [
            Container(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () =>
                      showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("提示"),
                            content: Text("是否删除此地址"),
                            actions: [
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancle'),
                                  child: Text("取消")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancle');
                                    logic.handleDeleteAddress();
                                  },
                                  child: Text("确定")),
                            ],
                          )),
                  child: Text(
                    "删除",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            builder: (context, child) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(10.0)),
                          width: ScreenUtil()
                              .setWidth(ScreenUtil().screenWidth * (9 / 10)),
                          child: TextFormField(
                              controller: logic.receiverEditingController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '请输入领用人',
                                  icon: Icon(Icons.person),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      logic.receiverEditingController.clear();
                                    },
                                  )),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return '请输入领用人';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(10.0)),
                          width: ScreenUtil()
                              .setWidth(ScreenUtil().screenWidth * (9 / 10)),
                          child: TextFormField(
                              controller: logic.phoneEditingController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '请输入电话号码',
                                  icon: Icon(Icons.phone_android),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      logic.phoneEditingController.clear();
                                    },
                                  )),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return '请输入电话号码';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(10.0)),
                          width: ScreenUtil()
                              .setWidth(ScreenUtil().screenWidth * (9 / 10)),
                          child: TextFormField(
                              controller: logic.userEditingController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '请输入使用人',
                                  icon: Icon(Icons.person_search),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      logic.userEditingController.clear();
                                    },
                                  )),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return '请输入使用人';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(10.0)),
                          width: ScreenUtil()
                              .setWidth(ScreenUtil().screenWidth * (9 / 10)),
                          child: TextFormField(
                              maxLines: 3,
                              controller: logic.addressDetailEditingController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '请输入详细地址',
                                  icon: Icon(Icons.house),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      logic.addressDetailEditingController
                                          .clear();
                                    },
                                  )),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return '请输入详细地址';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(5.0)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().screenWidth / 5,
                                child: Text("  默认地址:"),
                              ),
                              Expanded(child: Text("")),
                              Obx(() {
                                return Switch(
                                    value: state.isDefault,
                                    onChanged: (value) {
                                      state.isDefault = !state.isDefault;
                                    });
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(5.0)),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (!state.isCreate) {
                              logic.handleUpdateAddress();
                            } else {
                              logic.handleCreateAddress();
                            }
                          }
                        },
                        child: Container(
                          width: ScreenUtil().screenWidth,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(8.0)),
                          child: !state.isCreate ? Text("保存地址") : Text("新增地址"),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepOrange),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                            elevation: MaterialStateProperty.all(0.0)),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
    );
  }
}
