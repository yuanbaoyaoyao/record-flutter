import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../common/utils/toast_util.dart';
import 'applications_logic.dart';

class ApplicationsPage extends StatelessWidget {
  final logic = Get.find<ApplicationsLogic>();
  final state = Get.find<ApplicationsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("直接申请耗材"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
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
                              hintText: '请输入耗材数量',
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
                              return '请输入耗材数量';
                            } else {
                              return null;
                            }
                          }),
                      DropdownButtonFormField(
                          value: state.selectedAddress,
                          items: <String>['One', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            state.selectedAddress = value;
                          }),
                      Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(20.0)),
                          width: ScreenUtil().screenWidth,
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            child: Image.asset("assets/images/no_image.png",
                                fit: BoxFit.fitWidth,
                                width: ScreenUtil().setWidth(100.0)),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                        height: ScreenUtil().setHeight(200.0),
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
                                                          print("点击了选择图片");
                                                          state.isGallery =
                                                              true;
                                                          logic.handleGetImage(
                                                              context);
                                                        },
                                                        child: Text("选择图片")),
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
                                                        state.isCamera = true;
                                                        logic.handleGetImage(
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
                                              width: ScreenUtil().screenWidth,
                                              color: Colors.green,
                                              child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("取消")),
                                            ),
                                          ],
                                        ));
                                  });
                            },
                          )),
                      TextFormField(
                          controller: logic.textModelEditingController,
                          obscuringCharacter: "*",
                          maxLines: 4,
                          obscureText: false,
                          decoration: InputDecoration(
                              hintText: '请输入耗材描述',
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
                              return '请输入耗材描述';
                            } else {
                              return null;
                            }
                          }),
                      Container(
                        margin:
                            EdgeInsets.only(top: ScreenUtil().setHeight(10.0)),
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
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.deepOrange),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              elevation: MaterialStateProperty.all(0.0)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
