import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'message_box_logic.dart';

class Message_boxPage extends StatelessWidget {
  final logic = Get.find<Message_boxLogic>();
  final state = Get.find<Message_boxLogic>().state;

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("消息盒子"),
      actions: [
        IconButton(
            onPressed: () {
              print("点击了一键清理");
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
                        const Text("订单信息"),
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
                        const Text("反馈消息"),
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
                        const Text("服务通知"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListView(
            children: [
              Text("这是消息"),
              Text("这是消息"),
              Text("这是消息"),
              Text("这是消息"),
            ],
            shrinkWrap: true,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMessageBoxBody(),
    );
  }
}
