import 'dart:developer';

import 'package:get/get.dart';
import 'package:record_flutter/common/apis/product_skus_evaluation_api.dart';

import 'consumables_evaluation_state.dart';

class ConsumablesEvaluationLogic extends GetxController {
  final ConsumablesEvaluationState state = ConsumablesEvaluationState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInfo();
  }

  void getInfo() async {
    await ProductSkusEvaluationAPI.listProductSkusEvaluationIPageAPI(
            pageSize: state.pageSize,
            pageNum: 1,
            orderSn: null,
            orderProductId: null,
            productSkusId: Get.arguments)
        .then((value) {
      log("Get.arguments:" + Get.arguments.toString());
      log("value.toString:" + value.toJson().toString());
      for (var data in value.data.records) {
        data.avatar ??= "";
      }
      state.evaluations = value.data.records;
    });
  }
}
