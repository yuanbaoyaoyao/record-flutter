import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:record_flutter/common/widgets/icon_logo.dart';

import 'message_box_logic.dart';

class MessageBoxPage extends StatelessWidget {
  final logic = Get.find<MessageBoxLogic>();
  final state = Get.find<MessageBoxLogic>().state;

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("消息盒子"),
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("操作"),
                        content: Text("是否进行一键编辑"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancle'),
                              child: Text("取消")),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'Cancle');
                              logic.handleUpdateList();
                            },
                            child: Text(
                              "全部已读",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blueAccent)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'Cancle');
                              logic.handleDeleteList();
                            },
                            child: Text(
                              "全部删除",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.redAccent)),
                          ),
                        ],
                      ));
            },
            icon: const FaIcon(FontAwesomeIcons.broom))
      ],
      centerTitle: true,
      elevation: 0.0,
    );
  }

  Widget _buildMessageBoxBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: <Color>[
                    Color(0xFFEEEEEE),
                    Color(0xFF111133),
                  ],
                ),
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/message_box_bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Card(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              print("点击了订单消息");
                              Get.toNamed("/order_message");
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.fileCircleExclamation,
                              size: 30.0,
                            )),
                        const Text("订单提醒"),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              print("点击了反馈消息");
                              Get.toNamed("/feedback_message");
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.solidMessage,
                              size: 30.0,
                            )),
                        const Text("反馈提醒"),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              print("点击了服务通知");
                              Get.toNamed("/notification_message");
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.solidBell,
                              size: 30.0,
                            )),
                        const Text("公告通知"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(() {
            return Visibility(
              visible: state.message.length > 0,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: state.message.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text("提示"),
                                      content: Text("是否删除此通知"),
                                      actions: [
                                        TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancle'),
                                            child: Text("取消")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, 'Cancle');
                                              state.onTapMessage.id =
                                                  state.message[index].id;
                                              logic.handleDelete();
                                            },
                                            child: Text("确定")),
                                      ],
                                    ));
                          },
                          onTap: () {
                            state.onTapMessage.id = state.message[index].id;
                            if (state.message[index].userFeedbackId == null) {
                              Get.toNamed("/order_detail");
                            } else {
                              Get.toNamed("/feedback_detail");
                            }
                            logic.handleUpdate();
                          },
                          child: Row(
                            children: [
                              Container(
                                child: state.message[index].userFeedbackId !=
                                        null
                                    ? iconLogo(const Icon(Icons.feedback),
                                        state.message[index].isRead ? 0 : 1)
                                    : iconLogo(
                                        const Icon(Icons.insert_drive_file),
                                        state.message[index].isRead ? 0 : 1),
                                // Icon(Icons.announcement),
                                padding: const EdgeInsets.only(
                                    top: 20.0,
                                    right: 10.0,
                                    bottom: 15.0,
                                    left: 15.0),
                              ),
                              Container(
                                width: ScreenUtil().screenWidth * (4 / 5),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 0.5,
                                            color: Colors.grey))),
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        state.message[index].userFeedbackId !=
                                                null
                                            ? Text("反馈消息")
                                            : Text("订单消息"),
                                        Expanded(child: Text("")),
                                        Text(
                                          state.message[index].createdAt
                                              .toString(),
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    state.message[index].userFeedbackId != null
                                        ? Text(
                                            "用户反馈：${state.message[index].feedbackTitle}有新的消息",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )
                                        : Text(
                                            "订单号：${state.message[index].orderSn.toString()}有新的消息",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            );
          }),
          Visibility(
            visible: state.announcement.length > 0,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: state.announcement.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Container(
                              child: Icon(Icons.add_alert),
                              padding: EdgeInsets.all(20.0),
                            ),
                            Container(
                              width: ScreenUtil().screenWidth * (4 / 5),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          style: BorderStyle.solid,
                                          width: 0.5,
                                          color: Colors.grey))),
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("公告"),
                                      Expanded(child: Text("")),
                                      Text(
                                        state.announcement[index].createdAt
                                            .toString(),
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Text(
                                    state.announcement[index].title,
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Obx(() {
          return _buildMessageBoxBody();
        }));
  }
}
