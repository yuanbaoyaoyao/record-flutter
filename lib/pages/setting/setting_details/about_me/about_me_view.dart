import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'about_me_logic.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AboutMeLogic>();
    final state = Get.find<AboutMeLogic>().state;

    return Scaffold(
        appBar: AppBar(
          title: Text("关于我们"),
          centerTitle: true,
        ),
        body: ScreenUtilInit(
            builder: (context, child) => Container(
                  width: ScreenUtil().screenWidth,
                  alignment: Alignment.center,
                  child:
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              "assets/images/cat.png",
                              height: 200,
                              width: 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "此项目为元宝尧尧制作",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                )));
  }
}
