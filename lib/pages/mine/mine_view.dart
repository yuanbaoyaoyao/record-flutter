import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/widgets/red_dot_page.dart';
import '../application/application_logic.dart';
import 'mine_logic.dart';
import 'widgets/order_widget.dart';
import 'widgets/service_widget.dart';

class MinePage extends StatelessWidget {
  final logic = Get.find<MineLogic>();
  final state = Get.find<MineLogic>().state;
  final appLogic = Get.find<ApplicationLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  print("点击了搜索按钮");
                  Get.toNamed("/search");
                },
                icon: Icon(Icons.search_outlined)),
            IconButton(
                onPressed: () {
                  print("点击了设置按钮");
                  Get.toNamed("/setting");
                },
                icon: Icon(Icons.settings)),
            IconButton(
                onPressed: () {
                  print("点击了消息盒子");
                  Get.toNamed("/message_box");
                },
                icon: Icon(Icons.mail_outline)),
          ],
        ),
        body: SmartRefresher(
            controller: logic.refreshController,
            onRefresh: logic.onRefresh,
            onLoading: logic.onLoading,
            enablePullDown: true,
            enablePullUp: true,
            child: ScreenUtilInit(
              builder: (context, child) {
                return SingleChildScrollView(
                    child: Container(
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          child: InkWell(onTap: () {
                            Get.toNamed("/user_info");
                          }, child: Obx(() {
                            return Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey),
                                  child: ClipOval(
                                    child: Image.network(
                                      state.userAvatar == ""
                                          ? "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.616pic.com%2Fys_bnew_img%2F00%2F10%2F83%2F54xXAJVRIn.jpg&refer=http%3A%2F%2Fpic.616pic.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1658843958&t=e3c3bd7f7ece9b1b061098f435ffcd1f"
                                          : state.userAvatar,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Text(state.userName)
                              ],
                            );
                          }))),
                      orderWidget(),
                      serviceWidget(),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              child: Column(
                                children: [
                                  SizedBox(
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
                                  Obx(() {
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
                                                          .recommendList[index]
                                                          .id);
                                                },
                                                child: Card(
                                                    child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                                  width:
                                                      ScreenUtil().screenWidth /
                                                          2.1,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        child: Image.network(
                                                          state
                                                              .recommendList[
                                                                  index]
                                                              .avatar,
                                                          height: ScreenUtil()
                                                              .setHeight(110.0),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        alignment:
                                                            Alignment.center,
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
                                                          .recommendList[index]
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
                                                                        state
                                                                            .recommendList[index]
                                                                            .id,
                                                                        1);
                                                                    OverlayEntry?
                                                                        _overlayEntry =
                                                                        OverlayEntry(builder:
                                                                            (_) {
                                                                      RenderBox?
                                                                          box =
                                                                          context.findRenderObject()
                                                                              as RenderBox?;
                                                                      var offset =
                                                                          box!.localToGlobal(
                                                                              Offset.zero);
                                                                      return RedDotPage(
                                                                          startPosition:
                                                                              offset,
                                                                          endPosition:
                                                                              appLogic.endOffset);
                                                                    });
                                                                    Overlay.of(
                                                                            context)
                                                                        ?.insert(
                                                                            _overlayEntry);
                                                                    Future.delayed(
                                                                        const Duration(
                                                                            milliseconds:
                                                                                800),
                                                                        () {
                                                                      _overlayEntry
                                                                          ?.remove();
                                                                      _overlayEntry =
                                                                          null;
                                                                    });
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .add_circle_outline));
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
                                  })
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ));
              },
            )));
  }
}
