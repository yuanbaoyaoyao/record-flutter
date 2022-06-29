import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:record_flutter/pages/classification/classification_logic.dart';
import '../../application/application_logic.dart';
import '../home_logic.dart';

final logic = Get.find<HomeLogic>();
final state = Get.find<HomeLogic>().state;

Widget buildHomeClassification({
  required context,
}) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        children: [
          SizedBox(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().setHeight(165),
            child: ListView(
              controller: logic.scrollController,
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    Obx(() {
                      return Wrap(
                        children: _buildClassificationFirstFloorIconButton(),
                      );
                    }),
                    Obx(() {
                      return Wrap(
                        children: _buildClassificationSecondFloorIconButton(),
                      );
                    })
                  ],
                )
              ],
              shrinkWrap: true,
            ),
          ),
          Obx(() {
            return Visibility(
                //大于10才显示进度条
                visible: state.products.length > 10,
                child: Container(
                  margin: const EdgeInsets.all(0.0),
                  width: 5.0,
                  height: 15.0,
                  alignment: Alignment.topCenter,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 2.0),
                        inactiveTrackColor: Colors.grey),
                    child: Slider(
                        value: state.sliderValue,
                        max: state.sliderMaxValue,
                        onChanged: (value) {
                          state.sliderValue = value;
                        }),
                  ),
                ));
          })
        ],
      ));
}

List<Widget> _buildClassificationFirstFloorIconButton() =>
    List.generate((state.products.length / 2).toInt(), (index) {
      final applicationLogic = Get.find<ApplicationLogic>();
      final classificationLogic = Get.find<ClassificationLogic>();
      return InkWell(
          onTap: () {
            print("点击了图标");
            applicationLogic.handlePageChanged(1);
            applicationLogic.handleBottomNavBarTap(1);
            classificationLogic.handleChangeNavButton(index);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              children: [
                Image.network(
                  state.products[index].avatar,
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
                Text(state.products[index].title)
              ],
            ),
          ));
    });

List<Widget> _buildClassificationSecondFloorIconButton() {
  return List.generate(
      state.products.length - (state.products.length / 2).toInt(), (index) {
    final applicationLogic = Get.find<ApplicationLogic>();
    final classificationLogic = Get.find<ClassificationLogic>();
    return InkWell(
        onTap: () {
          print("点击了图标");
          applicationLogic.handlePageChanged(1);
          applicationLogic.handleBottomNavBarTap(1);
          int? i = (index + (state.products.length / 2).toInt()) as int?;
          classificationLogic.handleChangeNavButton(i!);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Column(
            children: [
              Image.network(
                state.products[index + (state.products.length / 2).toInt()]
                    .avatar,
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
              Text(state
                  .products[index + (state.products.length / 2).toInt()].title)
            ],
          ),
        ));
  });
}
