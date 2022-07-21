import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../consumables_detail_logic.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomBottomNavBarState();
  }
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final logic = Get.find<ConsumablesDetailLogic>();
  final state = Get.find<ConsumablesDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      return Row(
        children: [
          IconButton(
              onPressed: () {
                if (state.isLike) {
                  logic.handleRemoveFromCollections();
                } else {
                  logic.handleAddIntoCollections();
                }
              },
              icon: !state.isLike ? Icon(Icons.star_border) : Icon(Icons.star)),
          IconButton(
              onPressed: () {
                Get.toNamed("/cart");
              },
              icon: Icon(Icons.shopping_cart)),
          Expanded(child: Text("")),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.green,
            ),
            child: TextButton(
                onPressed: () {
                  logic.handleAddIntoCart(context);
                },
                child: Text("加入购物车")),
          ),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50.0),
          //     color: Colors.green,
          //   ),
          //   child: TextButton(
          //       onPressed: () {
          //         logic.handleToConfirmOrder();
          //       },
          //       child: Text("立即购买")),
          // ),
        ],
      );
    });
  }
}
