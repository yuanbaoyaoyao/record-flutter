import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../cart_logic.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomBottomNavBarState();
  }
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final logic = Get.find<CartLogic>();
  final state = Get.find<CartLogic>().state;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      return Container(
          child: Row(
        children: [
          Container(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      bool enable = true;
                      for (var item in state.cartList) {
                        if (item.productSkusNumber > item.stock) {
                          EasyLoading.showToast("请减少数量");
                          enable = false;
                          break;
                        }
                      }
                      if (enable) {
                        if (state.checkedCartItemList.length <
                            state.cartList.length) {
                          state.checkedCartItemList = [];
                          for (var item in state.cartList) {
                            state.checkedCartItemList.add(item);
                          }
                        } else {
                          state.checkedCartItemList = [];
                        }
                      }
                      logic.handleCount();
                    },
                    icon: state.checkedCartItemList.length ==
                            state.cartList.length
                        ? Icon(Icons.check_circle_outline)
                        : Icon(Icons.circle_outlined)),
                Text("全选"),
              ],
            ),
          ),
          Expanded(child: Text("")),
          Text("合计："),
          Text(
            state.checkedCartItemListNumber.toString(),
            style: TextStyle(fontSize: 20.0),
          ),
          Text("件"),
          Container(
            width: ScreenUtil().setWidth(80),
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: !state.isEditing ? Colors.red : Colors.grey,
            ),
            child: TextButton(
                onPressed: () {
                  print("点击了去结算");
                  if (state.isEditing == false) {
                    if (state.checkedCartItemList.length > 0) {
                      Get.toNamed("/confirm_order");
                    } else {
                      EasyLoading.showToast("请勾选需要结算的耗材");
                    }
                  } else {
                    if (state.checkedCartItemList.length == 0) {
                      EasyLoading.showToast("请选择耗材");
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("提示"),
                              content: Text("确认删除吗?"),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("取消"),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey)),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      if (state.checkedCartItemList.length >
                                          0) {
                                        logic.handleDeleteCartItemList();
                                        Navigator.pop(context);
                                        EasyLoading.showToast("删除成功");
                                      }
                                    },
                                    child: Text("确认")),
                              ],
                            );
                          });
                    }
                  }
                },
                child: !state.isEditing ? Text("去结算") : Text("删除")),
          )
        ],
      ));
    });
  }
}
