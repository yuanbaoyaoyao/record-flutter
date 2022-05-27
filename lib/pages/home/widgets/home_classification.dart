import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../application/application_logic.dart';

Widget buildHomeClassification({
  required context,
  required state,
  required logic,
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
            height: ScreenUtil().setHeight(170),
            child: ListView(
              controller: logic.scrollController,
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    Wrap(
                      children: _buildClassificationFirstFloorIconButton(),
                    ),
                    Wrap(
                      children: _buildClassificationSecondFloorIconButton(),
                    )
                  ],
                )
              ],
              shrinkWrap: true,
            ),
          ),
          Obx(() {
            return Container(
              margin: const EdgeInsets.all(0.0),
              width: 5.0,
              height: 15.0,
              alignment: Alignment.topCenter,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 2.0),
                    inactiveTrackColor: Colors.grey),
                child: Slider(
                    value: state.sliderValue,
                    max: state.sliderMaxValue,
                    onChanged: (value) {
                      print("$value");
                      state.sliderValue = value;
                    }),
              ),
            );
          })
        ],
      ));
}

List<Widget> _buildClassificationFirstFloorIconButton() =>
    List.generate(8, (index) {
      final applicationLogic = Get.find<ApplicationLogic>();
      return InkWell(
          onTap: () {
            print("点击了图标");
            applicationLogic.handlePageChanged(1);
            applicationLogic.handleBottomNavBarTap(1);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 50.0,
                ),
                Text("硒鼓")
              ],
            ),
          ));
    });

List<Widget> _buildClassificationSecondFloorIconButton() =>
    List.generate(8, (index) {
      final applicationLogic = Get.find<ApplicationLogic>();
      return InkWell(
          onTap: () {
            print("点击了图标");
            applicationLogic.handlePageChanged(1);
            applicationLogic.handleBottomNavBarTap(1);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 50.0,
                ),
                Text("硒鼓")
              ],
            ),
          ));
    });
