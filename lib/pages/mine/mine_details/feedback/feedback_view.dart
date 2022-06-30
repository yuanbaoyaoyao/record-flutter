import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'feedback_logic.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<FeedbackLogic>();
    final state = Get.find<FeedbackLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("我的反馈"),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Get.toNamed("/feedback_detail", parameters: {"isNew": "true"});
              },
              child: Text(
                "新增",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SingleChildScrollView(child: Obx(() {
        return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: state.message.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        state.onTapMessage.id = state.message[index].id;
                        Get.toNamed("/feedback_detail", parameters: {
                          "isNew": "false",
                          "id": state.message[index].id.toString(),
                          "feedbackPicUrl": state.message[index].feedbackPicUrl,
                          "feedbackTitle": state.message[index].feedbackTitle,
                          "feedbackContent":
                              state.message[index].feedbackContent,
                          "isFinished": state.message[index].isFinished.toString()
                        });
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    bottom: 10.0, right: 5.0, top: 10.0),
                                child: Image.network(
                                  state.message[index].feedbackPicUrl,
                                  fit: BoxFit.cover,
                                  width: ScreenUtil().setWidth(60.0),
                                  height: ScreenUtil().setHeight(60.0),
                                )),
                            Container(
                              width: ScreenUtil().screenWidth * (4 / 5),
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(state.message[index].feedbackTitle),
                                      Expanded(child: Text("")),
                                      Text(
                                        state.message[index].createdAt
                                            .toString(),
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Text(" "),
                                  Row(
                                    children: [
                                      Text(
                                        state.message[index].feedbackContent
                                                    .length >
                                                8
                                            ? state.message[index]
                                                    .feedbackContent
                                                    .substring(0, 8) +
                                                "......"
                                            : state
                                                .message[index].feedbackContent,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Expanded(child: Text("")),
                                      Text("状态：" +
                                          "${state.message[index].isFinished == true ? "已结束" : "进行中"}")
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    style: BorderStyle.solid,
                                    width: 0.1,
                                    color: Colors.black))),
                      ))
                ],
              );
            });
      })),
    );
  }
}
