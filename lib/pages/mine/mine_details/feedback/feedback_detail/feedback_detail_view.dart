import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/utils/toast_util.dart';
import 'feedback_detail_logic.dart';

class FeedbackDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<FeedbackDetailLogic>();
    final state = Get.find<FeedbackDetailLogic>().state;

    return Scaffold(
        appBar: AppBar(
          title: Text("反馈详情"),
          centerTitle: true,
          actions: [
            Visibility(
                visible: !state.isFinished,
                child: Obx(() {
                  return Visibility(
                      visible: !state.isNew,
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("提示"),
                                      content: Text("是否结束反馈"),
                                      actions: [
                                        TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancle'),
                                            child: Text("取消")),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'Cancle');
                                            logic.handleCloseFeedback();
                                          },
                                          child: Text(
                                            "确认结束",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.redAccent)),
                                        ),
                                      ],
                                    ));
                          },
                          child: Text(
                            "结束",
                            style: TextStyle(color: Colors.white),
                          )));
                }))
          ],
        ),
        body: NestedScrollView(headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          return [];
        }, body: Obx(() {
          return Form(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: ScreenUtil().setHeight(10.0)),
                        width: ScreenUtil()
                            .setWidth(ScreenUtil().screenWidth * (9 / 10)),
                        child: TextFormField(
                            enabled: state.isNew ? true : false,
                            controller: logic.titleEditingController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '请输入反馈标题',
                                icon: Icon(Icons.title),
                                suffixIcon: Obx(() {
                                  return Visibility(
                                      visible: state.hasTitle,
                                      child: IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          logic.titleEditingController.clear();
                                        },
                                      ));
                                })),
                            onChanged: (text) {
                              if (text.isNotEmpty) {
                                state.hasTitle = true;
                              } else {
                                state.hasTitle = false;
                              }
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return '请输入反馈标题';
                              } else {
                                return null;
                              }
                            }),
                      ),
                      Visibility(
                        visible: state.isNew,
                        child: Container(
                            margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(20.0),
                              bottom: ScreenUtil().setHeight(20.0),
                            ),
                            width: ScreenUtil().screenWidth,
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.picture_in_picture,
                                    color: Colors.black54,
                                  ),
                                  margin: EdgeInsets.only(
                                      right: ScreenUtil().setWidth(20.0)),
                                ),
                                GestureDetector(
                                  child: Image.asset(
                                      "assets/images/no_image.png",
                                      fit: BoxFit.fitWidth,
                                      width: ScreenUtil().setWidth(100.0)),
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                              height:
                                                  ScreenUtil().setHeight(200.0),
                                              color: Colors.amber,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Container(
                                                          child: TextButton(
                                                              onPressed: () {
                                                                print(
                                                                    "点击了选择图片");
                                                                state.isGallery =
                                                                    true;
                                                                logic.handleGetImage(
                                                                    context);
                                                              },
                                                              child:
                                                                  Text("选择图片")),
                                                          width: ScreenUtil()
                                                                  .screenWidth /
                                                              3,
                                                          height: ScreenUtil()
                                                              .setHeight(100.0),
                                                          color: Colors.green,
                                                        ),
                                                        Container(
                                                          child: TextButton(
                                                            onPressed: () {
                                                              print("点击了使用相机");
                                                              state.isCamera =
                                                                  true;
                                                              logic
                                                                  .handleGetImage(
                                                                      context);
                                                            },
                                                            child: Text("使用相机"),
                                                          ),
                                                          width: ScreenUtil()
                                                                  .screenWidth /
                                                              3,
                                                          height: ScreenUtil()
                                                              .setHeight(100.0),
                                                          color: Colors.green,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(child: Text("")),
                                                  Container(
                                                    width: ScreenUtil()
                                                        .screenWidth,
                                                    color: Colors.green,
                                                    child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("取消")),
                                                  ),
                                                ],
                                              ));
                                        });
                                  },
                                )
                              ],
                            )),
                      ),
                      Visibility(
                        visible: !state.isNew,
                        child: Container(
                            margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(20.0),
                              bottom: ScreenUtil().setHeight(20.0),
                            ),
                            width: ScreenUtil().screenWidth,
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.picture_in_picture,
                                    color: Colors.black54,
                                  ),
                                  margin: EdgeInsets.only(
                                      right: ScreenUtil().setWidth(20.0)),
                                ),
                                Image.network(
                                  state.feedbackPicUrl,
                                  fit: BoxFit.fitWidth,
                                  width: ScreenUtil().setWidth(100.0),
                                  height: ScreenUtil().setHeight(100.0),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: ScreenUtil().setHeight(10.0)),
                        width: ScreenUtil()
                            .setWidth(ScreenUtil().screenWidth * (9 / 10)),
                        child: TextFormField(
                            enabled: state.isNew ? true : false,
                            maxLines: 3,
                            controller: logic.descriptionEditingController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '请输入反馈内容',
                                icon: Icon(Icons.pending),
                                suffixIcon: Obx(() {
                                  return Visibility(
                                      visible: state.hasContent,
                                      child: IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          logic.descriptionEditingController
                                              .clear();
                                        },
                                      ));
                                })),
                            onChanged: (text) {
                              if (text.isNotEmpty) {
                                state.hasContent = true;
                              } else {
                                state.hasContent = false;
                              }
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return '请输入反馈内容';
                              } else {
                                return null;
                              }
                            }),
                      ),
                      Visibility(
                          visible: state.isNew,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(10.0)),
                            child: ElevatedButton(
                              onPressed: () {
                                ToastUtil().showToast("提交成功");
                                Get.back();
                              },
                              child: Container(
                                width: ScreenUtil().screenWidth,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: ScreenUtil().setHeight(8.0)),
                                child: Text("提交"),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.deepOrange),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40))),
                                  elevation: MaterialStateProperty.all(0.0)),
                            ),
                          )),
                      SingleChildScrollView(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    ScreenUtil().setWidth(5.0))),
                                color: Colors.black54),
                            width: ScreenUtil().screenWidth,
                            height: ScreenUtil().setHeight(200.0),
                            child: Scrollbar(
                              child: ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        child: Visibility(
                                          visible: state.detailInfo.data[index]
                                                  .adminUserName !=
                                              "",
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(state.detailInfo.data[index]
                                                  .adminUserName),
                                              ChatBubble(
                                                clipper: ChatBubbleClipper9(
                                                    type: BubbleType
                                                        .receiverBubble),
                                                backGroundColor:
                                                    Color(0xffE7E7ED),
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                  ),
                                                  child: Text(
                                                    state.detailInfo.data[index]
                                                        .content,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                          visible: state.detailInfo.data[index]
                                                  .adminUserName ==
                                              "",
                                          child: ChatBubble(
                                            clipper: ChatBubbleClipper9(
                                                type: BubbleType.sendBubble),
                                            alignment: Alignment.topRight,
                                            margin: EdgeInsets.only(top: 20),
                                            backGroundColor: Colors.blue,
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                              ),
                                              child: Text(
                                                state.detailInfo.data[index]
                                                    .content,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ))
                                    ],
                                  );
                                },
                                itemCount: state.detailInfoLength,
                              ),
                            )),
                      ),
                      Visibility(
                        visible: !state.isFinished,
                        child: TextField(
                          maxLines: 2,
                          controller: logic.inputEditingController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.phone_in_talk),
                              labelText: "请输入反馈信息"),
                        ),
                      ),
                      Visibility(
                        visible: !state.isFinished,
                        child: Container(
                          alignment: Alignment.topRight,
                          child: ElevatedButton(
                            onPressed: () {
                              logic.handleAddFeedbackDetail();
                            },
                            child: Text("发送消息"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        })));
  }
}
