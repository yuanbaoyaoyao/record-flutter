import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Widget buildHomeClassification({
  required context,
  required state,
  required logic,
}) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: ScreenUtil().screenWidth,
            margin: EdgeInsets.only(bottom: 0.0),
            height: 130.0,
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
      return InkWell(
        onTap: () {
          print("点击了图标");
        },
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 20.0,
            ),
            TextButton(
                onPressed: () {
                  print("点击了分类");
                },
                child: Text("硒鼓"))
          ],
        ),
      );
    });

List<Widget> _buildClassificationSecondFloorIconButton() =>
    List.generate(8, (index) {
      return InkWell(
        onTap: () {
          print("点击了图标");
        },
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 20.0,
            ),
            TextButton(
                onPressed: () {
                  print("点击了分类");
                },
                child: Text("硒鼓"))
          ],
        ),
      );
    });
