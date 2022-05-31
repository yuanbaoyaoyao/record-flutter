import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'applications_logic.dart';

class ApplicationsPage extends StatelessWidget {
  final logic = Get.find<ApplicationsLogic>();
  final state = Get.find<ApplicationsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("直接申请耗材"),
          centerTitle: true,
        ),
        body: Form(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: Column(
                  children: [
                    TextFormField(
                        controller: logic.textTypeEditingController,
                        decoration: InputDecoration(
                            hintText: '请输入耗材类别',
                            suffixIcon: Obx(() {
                              return Visibility(
                                visible: logic.state.hasTypeContent,
                                child: IconButton(
                                  icon: const FaIcon(
                                      FontAwesomeIcons.circleXmark,
                                      color:
                                          Color.fromRGBO(142, 142, 142, 1.0)),
                                  onPressed: () {
                                    logic.textTypeEditingController.clear();
                                    logic.state.hasTypeContent = false;
                                  },
                                ),
                              );
                            })),
                        onChanged: (text) {
                          if (text.isNotEmpty) {
                            logic.state.hasTypeContent = true;
                          } else {
                            logic.state.hasTypeContent = false;
                          }
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return '请输入耗材类别';
                          } else {
                            return null;
                          }
                        }),
                    TextFormField(
                        controller: logic.textModelEditingController,
                        obscuringCharacter: "*",
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: '请输入耗材型号',
                            suffixIcon: Obx(() {
                              return Visibility(
                                visible: logic.state.hasModelContent,
                                child: IconButton(
                                  icon: const FaIcon(
                                      FontAwesomeIcons.circleXmark,
                                      color:
                                          Color.fromRGBO(142, 142, 142, 1.0)),
                                  onPressed: () {
                                    logic.textModelEditingController.clear();
                                    logic.state.hasModelContent = false;
                                  },
                                ),
                              );
                            })),
                        onChanged: (text) {
                          if (text.isNotEmpty) {
                            logic.state.hasModelContent = true;
                          } else {
                            logic.state.hasModelContent = false;
                          }
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return '请输入耗材型号';
                          } else {
                            return null;
                          }
                        }),
                    TextFormField(
                        controller: logic.textModelEditingController,
                        obscuringCharacter: "*",
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: '请输入耗材型号',
                            suffixIcon: Obx(() {
                              return Visibility(
                                visible: logic.state.hasModelContent,
                                child: IconButton(
                                  icon: const FaIcon(
                                      FontAwesomeIcons.circleXmark,
                                      color:
                                          Color.fromRGBO(142, 142, 142, 1.0)),
                                  onPressed: () {
                                    logic.textModelEditingController.clear();
                                    logic.state.hasModelContent = false;
                                  },
                                ),
                              );
                            })),
                        onChanged: (text) {
                          if (text.isNotEmpty) {
                            logic.state.hasModelContent = true;
                          } else {
                            logic.state.hasModelContent = false;
                          }
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return '请输入耗材型号';
                          } else {
                            return null;
                          }
                        }),
                    TextFormField(
                        controller: logic.textModelEditingController,
                        obscuringCharacter: "*",
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: '请输入耗材型号',
                            suffixIcon: Obx(() {
                              return Visibility(
                                visible: logic.state.hasModelContent,
                                child: IconButton(
                                  icon: const FaIcon(
                                      FontAwesomeIcons.circleXmark,
                                      color:
                                          Color.fromRGBO(142, 142, 142, 1.0)),
                                  onPressed: () {
                                    logic.textModelEditingController.clear();
                                    logic.state.hasModelContent = false;
                                  },
                                ),
                              );
                            })),
                        onChanged: (text) {
                          if (text.isNotEmpty) {
                            logic.state.hasModelContent = true;
                          } else {
                            logic.state.hasModelContent = false;
                          }
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return '请输入耗材型号';
                          } else {
                            return null;
                          }
                        }),
                    Container(
                      width: ScreenUtil().screenWidth,
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            print("点击了IconButton");
                            logic.handleGetImage();
                          },
                          icon: Icon(FontAwesomeIcons.image)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
