import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../common/widgets/icon_logo.dart';
import 'notification_message_logic.dart';

class NotificationMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<NotificationMessageLogic>();
    final state = Get.find<NotificationMessageLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("公告通知"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: Obx(() {
        return Visibility(
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
                            child: Icon(Icons.insert_drive_file),
                            // Icon(Icons.announcement),
                            padding: const EdgeInsets.only(
                                top: 20.0,
                                right: 20.0,
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
                                    Text(state.announcement[index].title),
                                    Expanded(child: Text("")),
                                    Text(
                                      state.announcement[index].createdAt
                                          .toString(),
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                Text(
                                  state.announcement[index].content,
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
