import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../common/widgets/icon_logo.dart';
import 'feedback_message_logic.dart';

class FeedbackMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<FeedbackMessageLogic>();
    final state = Get.find<FeedbackMessageLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("反馈消息"),
        centerTitle: true,
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
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancle'),
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
      ),
      body: SingleChildScrollView(child: Obx(() {
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
                      onTap: () {
                        state.onTapMessage.id = state.message[index].id;
                        Get.toNamed("/feedback_detail");
                        logic.handleUpdate();
                      },
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text("提示"),
                                  content: Text("是否删除此通知"),
                                  actions: [
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancle'),
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
                      child: Row(
                        children: [
                          Container(
                            child: iconLogo(Icon(Icons.insert_drive_file),
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
                                    Text("反馈消息"),
                                    Expanded(child: Text("")),
                                    Text(
                                      state.message[index].createdAt.toString(),
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                Text(
                                  "反馈消息：${state.message[index].feedbackTitle.toString()}有新的消息",
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
        );
      })),
    );
  }
}
