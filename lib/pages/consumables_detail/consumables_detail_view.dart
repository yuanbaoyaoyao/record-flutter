import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'consumables_detail_logic.dart';

class ConsumablesDetailPage extends StatelessWidget {
  final logic = Get.find<ConsumablesDetailLogic>();
  final state = Get
      .find<ConsumablesDetailLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
      ),
      // body: _buildConsumablesDetailBody(),
    );
  }

  // Widget _buildConsumablesDetailBody() {
  //   return Scaffold(
  //     body: Stack(
  //       children: [
  //         SingleChildScrollView(
  //           controller: scrollController,
  //           child: Column(
  //             children: [
  //               Container(
  //                 key:,
  //                 child:,
  //               ),
  //               Container(
  //                 child:,
  //               )
  //             ],
  //           ),
  //         ),
  //         Opacity(
  //           opacity:,
  //           child: Container(
  //             height: ScreenUtil().setHeight(78),
  //             color: Colors.blue,
  //             child:,
  //           ),)
  //       ],
  //     ),
  //   );
  // }
}
