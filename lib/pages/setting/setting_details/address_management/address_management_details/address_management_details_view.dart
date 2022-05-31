import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/utils/toast_util.dart';

import 'address_management_details_logic.dart';

class AddressManagementDetailsPage extends StatelessWidget {
  final logic = Get.find<AddressManagementDetailsLogic>();
  final state = Get.find<AddressManagementDetailsLogic>().state;

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
                onPressed: () => showDialog(
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
                                onPressed: () => Navigator.pop(context, 'OK'),
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
      body: ScreenUtilInit(
        builder: (context, child) {
          return Container(
              color: Colors.grey,
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(10.0),
                  vertical: ScreenUtil().setHeight(10.0)),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(5.0)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().screenWidth / 5,
                          child: Text("收货人:"),
                        ),
                        SizedBox(
                          width: ScreenUtil().screenWidth / 10,
                        ),
                        Text("元宝"),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(5.0)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().screenWidth / 5,
                          child: Text("手机号码:"),
                        ),
                        SizedBox(
                          width: ScreenUtil().screenWidth / 10,
                        ),
                        Text("180****8647"),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(5.0)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().screenWidth / 5,
                          child: Text("所在地区:"),
                        ),
                        SizedBox(
                          width: ScreenUtil().screenWidth / 10,
                        ),
                        Text("天津市 武清区 开发区"),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(5.0)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().screenWidth / 5,
                          child: Text("详细地址:"),
                        ),
                        SizedBox(
                          width: ScreenUtil().screenWidth / 10,
                        ),
                        Expanded(
                          child:
                              Text("创业总部基地B01sdfdsfdsfdsfsssssqerewfwgweweg"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(5.0)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().screenWidth / 5,
                          child: Text("默认地址:"),
                        ),
                        Expanded(child: Text("")),
                        Obx(() {
                          return Switch(
                              value: state.test,
                              onChanged: (value) {
                                state.test = !state.test;
                                if (state.test) {
                                  ToastUtil().showToast("设置默认地址成功");
                                }
                              });
                        })
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(5.0)),
                    child: ElevatedButton(
                      onPressed: () {
                        ToastUtil().showToast("保存成功");
                        Get.back();
                      },
                      child: Container(
                        width: ScreenUtil().screenWidth,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(8.0)),
                        child: Text("保存"),
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
              ));
        },
      ),
    );
  }
}
