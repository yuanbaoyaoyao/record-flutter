import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:record_flutter/pages/consumables_detail/widgets/custom_bottom_nav_bar.dart';

import 'consumables_evaluation_logic.dart';

class ConsumablesEvaluationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ConsumablesEvaluationLogic>();
    final state = Get.find<ConsumablesEvaluationLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("耗材评价页"),
        centerTitle: true,
      ),
      body: ScreenUtilInit(
          builder: (context, child) => Obx(() {
                return NestedScrollView(
                  body: MediaQuery.removePadding(
                    child: ListView.builder(
                        itemCount: state.evaluations.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(10.0),
                                  bottom: ScreenUtil().setHeight(5.0)),
                              width: ScreenUtil().screenWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: ScreenUtil().setHeight(10.0)),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(
                                              ScreenUtil().setHeight(5.0)),
                                          child: ClipOval(
                                              child: Column(
                                            children: [
                                              Visibility(
                                                visible: state
                                                        .evaluations[index]
                                                        .avatar ==
                                                    "",
                                                child: Image.asset(
                                                  "assets/images/cat.png",
                                                  height: ScreenUtil()
                                                      .setHeight(30.0),
                                                  width: ScreenUtil()
                                                      .setHeight(30.0),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Visibility(
                                                visible: state
                                                        .evaluations[index]
                                                        .avatar !=
                                                    "",
                                                child: Image.network(
                                                  state.evaluations[index]
                                                      .avatar,
                                                  height: ScreenUtil()
                                                      .setHeight(30.0),
                                                  width: ScreenUtil()
                                                      .setHeight(30.0),
                                                  fit: BoxFit.contain,
                                                ),
                                              )
                                            ],
                                          )),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(state
                                                .evaluations[index].receiver),
                                            Text(state
                                                .evaluations[index].createdAt
                                                .toString())
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: ScreenUtil().setHeight(40.0),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black54,
                                                  width: 0.5)),
                                        ),
                                        padding: EdgeInsets.only(
                                            bottom:
                                                ScreenUtil().setHeight(10.0)),
                                        width: ScreenUtil().screenWidth -
                                            ScreenUtil().setWidth(50.0),
                                        child: Text(state.evaluations[index]
                                            .productSkusEvaluation),
                                      )
                                    ],
                                  )
                                ],
                              ));
                        }),
                    context: context,
                  ),
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [];
                  },
                );
              })),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
