import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:record_flutter/common/constant/user_constant.dart';
import 'package:record_flutter/common/entities/cart_entity.dart';
import 'package:sp_util/sp_util.dart';
import '../../common/widgets/red_dot_page.dart';
import '../application/application_logic.dart';
import 'widgets/custom_bottom_nav_bar.dart';

import 'cart_logic.dart';

class CartPage extends StatelessWidget {
  final logic = Get.find<CartLogic>();
  final state = Get.find<CartLogic>().state;
  final appLogic = Get.find<ApplicationLogic>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Scaffold(
              appBar: AppBar(
                title: const Text("购物车"),
                centerTitle: true,
                actions: [
                  Obx(() {
                    return TextButton(
                        onPressed: () {
                          state.isEditing = !state.isEditing;
                          print("state.isEditing:${state.isEditing}");
                        },
                        child: !state.isEditing
                            ? const Text(
                                "编辑",
                                style: TextStyle(color: Colors.white),
                              )
                            : const Text(
                                "完成",
                                style: TextStyle(color: Colors.redAccent),
                              ));
                  })
                ],
              ),
              body: SmartRefresher(
                  controller: logic.refreshController,
                  onRefresh: logic.onRefresh,
                  onLoading: logic.onLoading,
                  enablePullDown: true,
                  enablePullUp: true,
                  child: SingleChildScrollView(
                      child: Container(
                          color: Colors.grey,
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(5)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(
                                            ScreenUtil().setWidth(5))),
                                  ),
                                  child: Obx(() {
                                    return Column(
                                      children: [
                                        Column(
                                          children: _buildCartItemList(),
                                        ),
                                        Visibility(
                                            visible: state.cartList.length == 0,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20.0),
                                              color: Colors.white,
                                              width: ScreenUtil().screenWidth,
                                              alignment: Alignment.center,
                                              child: Text("购物车空空如也~ w(ﾟДﾟ)w"),
                                            ))
                                      ],
                                    );
                                  })),
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Icon(Icons.music_note),
                                          Text("为你推荐"),
                                          Icon(Icons.music_note),
                                        ],
                                      ),
                                      width: 180.0,
                                    ),
                                    Container(
                                        margin:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Obx(() {
                                          return GridView.count(
                                              childAspectRatio: 9 / 10,
                                              crossAxisCount: 2,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              children: List.generate(
                                                  state.recommendList.length,
                                                  (index) {
                                                return Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(
                                                            "/consumables_detail",
                                                            arguments: state
                                                                .recommendList[
                                                                    index]
                                                                .id);
                                                      },
                                                      child: Card(
                                                          child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    5.0),
                                                        width: ScreenUtil()
                                                                .screenWidth /
                                                            2.1,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.network(
                                                                state
                                                                    .recommendList[
                                                                        index]
                                                                    .avatar,
                                                                height: ScreenUtil()
                                                                    .setHeight(
                                                                        110.0),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                            ),
                                                            Text(state
                                                                    .recommendList[
                                                                        index]
                                                                    .productName +
                                                                ' ' +
                                                                state
                                                                    .recommendList[
                                                                        index]
                                                                    .title),
                                                            Text(state
                                                                .recommendList[
                                                                    index]
                                                                .description),
                                                            Flexible(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "剩余${state.recommendList[index].stock.toString()}个",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20.0),
                                                                  ),
                                                                  Builder(builder:
                                                                      (context) {
                                                                    return IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          logic.handleAddIntoCart(
                                                                              state.recommendList[index].id,
                                                                              1);
                                                                          OverlayEntry?
                                                                              _overlayEntry =
                                                                              OverlayEntry(builder: (_) {
                                                                            RenderBox?
                                                                                box =
                                                                                context.findRenderObject() as RenderBox?;
                                                                            var offset =
                                                                                box!.localToGlobal(Offset.zero);
                                                                            return RedDotPage(
                                                                                startPosition: offset,
                                                                                endPosition: appLogic.endOffset);
                                                                          });
                                                                          Overlay.of(context)
                                                                              ?.insert(_overlayEntry);
                                                                          Future.delayed(
                                                                              const Duration(milliseconds: 800),
                                                                              () {
                                                                            _overlayEntry?.remove();
                                                                            _overlayEntry =
                                                                                null;
                                                                          });
                                                                        },
                                                                        icon: const Icon(
                                                                            Icons.add_circle_outline));
                                                                    // );
                                                                  })
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                    ),
                                                  ],
                                                );
                                              }));
                                        }))
                                  ],
                                ),
                              )
                            ],
                          )))),
              bottomNavigationBar: CustomBottomNavBar(),
            ));
  }

  List<Widget> _buildCartItemList() =>
      List.generate(state.cartList.length, (index) {
        return Container(
          color: Colors.white,
          margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(0.5)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(5)),
                padding: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                    onPressed: () {
                      if (state.cartList[index].productSkusNumber >
                          state.cartList[index].stock) {
                        EasyLoading.showToast("请减少数量");
                      } else {
                        if (state.checkedCartItemList
                                .indexOf(state.cartList[index]) ==
                            -1) {
                          state.checkedCartItemList.add(state.cartList[index]);
                        } else {
                          state.checkedCartItemList
                              .remove(state.cartList[index]);
                        }
                        logic.handleCount();
                      }
                    },
                    icon: state.checkedCartItemList
                            .contains(state.cartList[index])
                        ? Icon(Icons.check_circle_outline)
                        : Icon(Icons.circle_outlined)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.network(
                  state.cartList[index].avatar,
                  width: 80.0,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(state.cartList[index].productName),
                          const Expanded(child: Text("")),
                          Text(
                            "剩余${state.cartList[index].stock.toString()}个",
                            style: TextStyle(
                                color: state.cartList[index].productSkusNumber >
                                        state.cartList[index].stock
                                    ? Colors.red
                                    : Colors.black),
                          ),
                          Text("   "),
                        ],
                      ),
                      Row(
                        children: [
                          Text(state.cartList[index].title),
                          const Expanded(child: Text("")),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if (state
                                            .cartList[index].productSkusNumber >
                                        1) {
                                      state.cartList[index].productSkusNumber--;
                                      state.onTapCartItem = CartUpdateEntity(
                                          userId: SpUtil.getInt(
                                              UserConstant.userId),
                                          productSkusId: state
                                              .cartList[index].productSkusId,
                                          productSkusNumber: state
                                              .cartList[index]
                                              .productSkusNumber,
                                          id: state.cartList[index].id);
                                      logic.handleUpdateCartItem(index);
                                      EasyLoading.showToast("减少购物车数量成功");
                                    } else {
                                      EasyLoading.showToast("最少购买一件哦!");
                                    }
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    color: state.cartList[index]
                                                .productSkusNumber ==
                                            1
                                        ? Colors.grey
                                        : Colors.black,
                                  )),
                              Obx(() {
                                return Text(state
                                    .cartList[index].productSkusNumber
                                    .toString());
                              }),
                              IconButton(
                                  onPressed: () {
                                    if (state
                                            .cartList[index].productSkusNumber <
                                        state.cartList[index].stock) {
                                      state.cartList[index].productSkusNumber++;
                                      state.onTapCartItem = CartUpdateEntity(
                                          userId: SpUtil.getInt(
                                              UserConstant.userId),
                                          productSkusId: state
                                              .cartList[index].productSkusId,
                                          productSkusNumber: state
                                              .cartList[index]
                                              .productSkusNumber,
                                          id: state.cartList[index].id);
                                      logic.handleUpdateCartItem(index);
                                      EasyLoading.showToast("增加购物车数量成功");
                                    } else {
                                      EasyLoading.showToast("超过库存数量，无法增加");
                                    }
                                  },
                                  icon: const Icon(Icons.add_circle_outline)),
                            ],
                          )
                        ],
                      )
                    ]),
              ),
            ],
          ),
        );
      });
}
