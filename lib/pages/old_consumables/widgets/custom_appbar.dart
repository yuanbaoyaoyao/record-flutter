import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_flutter/pages/old_consumables/old_consumables_logic.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  late final double contentHeight;
  late Color navigationBarBackgroundColor;

  CustomAppBar({
    Key? key,
    this.contentHeight = 50,
    this.navigationBarBackgroundColor = Colors.white,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomAppbarState();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(contentHeight);
}

class CustomAppbarState extends State<CustomAppBar> {
  final state = Get.find<OldConsumablesLogic>().state;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      return Opacity(
        opacity: state.appBarT,
        child: Container(
          color: widget.navigationBarBackgroundColor,
          child: SafeArea(
            top: true,
            child: Container(
              // decoration: const UnderlineTabIndicator(
              //     // borderSide: BorderSide(width: 1.0, color: Color(0xFFeeeeee)),
              //     ),
              color: widget.navigationBarBackgroundColor,
              height: widget.contentHeight,
              // child: Stack(
              //   alignment: Alignment.center,
              //   children: [
              //     Positioned(
              //         left: 0,
              //         child: Container(
              //             padding: const EdgeInsets.only(left: 5),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(50.0),
              //                   color: Colors.white),
              //               child: IconButton(
              //                 onPressed: () {
              //                   print("点击了返回按钮");
              //                   Get.back();
              //                 },
              //                 icon: const Icon(Icons.arrow_back),
              //               ),
              //             )
              //         )),
              //     Positioned(
              //       right: 0,
              //       child: Container(
              //           padding: const EdgeInsets.only(right: 5),
              //           child: Container(
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(50.0),
              //                 color: Colors.white),
              //             child: IconButton(
              //               onPressed: () {
              //                 print("点击了搜索");
              //                 Get.toNamed("/search");
              //               },
              //               icon: const Icon(Icons.search),
              //             ),
              //           )),
              //     ),
              //   ],
              // ),
            ),
          ),
        ),
      );
    });
  }
}
