

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/common/entities/user_address_entity.dart';
import 'package:sp_util/sp_util.dart';

import 'address_management_logic.dart';

class AddressManagementPage extends StatelessWidget {
  final logic = Get.find<AddressManagementLogic>();
  final state = Get.find<AddressManagementLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("地址管理"),
        centerTitle: true,
      ),
      body: ScreenUtilInit(
        builder: (context, child) {
          return Obx(() {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 8.0),
                      child: MediaQuery.removePadding(
                          context: context,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.addressList.code != null
                                  ? state.addressList.data.length
                                  : 0,
                              itemBuilder: (BuildContext context, int index) =>
                                  InkWell(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(20.0),
                                          top: ScreenUtil().setHeight(10.0)),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    state.addressList
                                                        .data[index].receiver,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text("    "),
                                                  Text(
                                                    state.addressList
                                                            .data[index].phone +
                                                        " ",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  Visibility(
                                                      visible: state
                                                              .addressList
                                                              .data[index]
                                                              .isDefault ==
                                                          true,
                                                      child: Text(
                                                        "默认",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            backgroundColor:
                                                                Colors
                                                                    .redAccent,
                                                            color:
                                                                Colors.white),
                                                      ))
                                                ],
                                              ),
                                              Text(
                                                  "使用人：${state.addressList.data[index].user}"),
                                              Text(state.addressList.data[index]
                                                  .addressDetail)
                                            ],
                                          ),
                                          Expanded(child: Text("")),
                                          Icon(Icons.chevron_right)
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Get.toNamed("/address_management_details",
                                          arguments:
                                              state.addressList.data[index]);
                                    },
                                  )))),
                ],
              ),
            );
          });
        },
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if(state.isLimit){
            EasyLoading.showToast("最多5个地址，请删除后新增");
          }else{
            Get.toNamed("/address_management_details",
                arguments: UserAddressUpdateEntity(
                    id: null,
                    userId: SpUtil.getInt(UserConstant.userId),
                    addressDetail: null,
                    receiver: null,
                    user: null,
                    phone: null,
                    isDefault: false));
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 15,
            ),
            Text("新建收货地址"),
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
            elevation: MaterialStateProperty.all(0.0)),
      ),
    );
  }
}
