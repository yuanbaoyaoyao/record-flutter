import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:record_flutter/pages/search_orders/search_orders_details/search_orders_details_logic.dart';
import 'package:record_flutter/pages/search_orders/search_orders_logic.dart';
import 'package:skeletons/skeletons.dart';

final logic = Get.find<SearchOrdersDetailsLogic>();
final state = Get.find<SearchOrdersDetailsLogic>().state;

class SearchOrdersDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ScreenUtilInit(
        builder: (context, child) {
          return Obx(() {
            return Skeleton(
                isLoading: state.countDown > 0 ? true : false,
                skeleton: SkeletonListView(),
                child: Container(
                    color: Colors.grey,
                    child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                            itemCount: state.orderList.length,
                            itemBuilder: (context, index) => Container(
                                color: Colors.white,
                                padding:
                                EdgeInsets.all(ScreenUtil().setWidth(10.0)),
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(5.0)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(state.orderList[index].createdAt
                                            .toString()),
                                        Expanded(child: Text("")),
                                        state.orderList[index].orderStatus == 1
                                            ? Text("审核中")
                                            : state.orderList[index]
                                            .orderStatus ==
                                            2
                                            ? Text("待收货")
                                            : state.orderList[index]
                                            .orderStatus ==
                                            3
                                            ? Text("待评价")
                                            : state.orderList[index]
                                            .orderStatus ==
                                            4
                                            ? Text("已结束")
                                            : state.orderList[index]
                                            .orderStatus ==
                                            0
                                            ? Text("已驳回")
                                            : Text("已取消"),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                          ScreenUtil().setHeight(5.0)),
                                      decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.grey)),
                                      child: GestureDetector(
                                        child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: ScreenUtil()
                                                    .setHeight(10.0)),
                                            child: Row(
                                              children: [
                                                Row(
                                                  children: state.orderList
                                                      .length >
                                                      0
                                                      ? _buildConsumables(index)
                                                      : [Text("")],
                                                ),
                                                Expanded(child: Text("")),
                                                Text(
                                                    "总共${state.orderProductCount.length > 0 ? state.orderProductCount[index].toString() : "0"}个"),
                                                Icon(Icons.chevron_right)
                                              ],
                                            )),
                                        onTap: () {
                                          Get.toNamed("/order_detail",
                                              arguments:
                                              state.orderList[index].id);
                                        },
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty
                                                    .all(RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        100.0)))),
                                            onPressed: () {
                                              Get.toNamed("order_detail",
                                                  arguments: state
                                                      .orderList[index].id);
                                            },
                                            child: Text("查看详情"))
                                      ],
                                    )
                                  ],
                                ))))));
          });
        },
      ),
    );
  }
}

List<Widget> _buildConsumables(int i) => state.orderProductList.length > 0
    ? List.generate(state.orderProductList[i].data.length, (index) {
  return Container(
    padding: EdgeInsets.only(left: 3.0),
    child: Image.network(
      state.orderProductList[i].data[index].productPicUrl,
      width: ScreenUtil().setWidth(60.0),
      fit: BoxFit.fitWidth,
    ),
  );
})
    : List.generate(1, (index) => Text(""));

AppBar _buildAppBar() {
  return AppBar(
    leadingWidth: 30.0,
    title: TextFormField(
      decoration: InputDecoration(
          isCollapsed: true,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 5, vertical: -3),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
          fillColor: Colors.white,
          filled: true,
          hintText: '请输入搜索内容',
          suffix: ElevatedButton.icon(
            onPressed: () {
              Get.toNamed("/search_orders");
            },
            icon: const Icon(Icons.search_outlined),
            label: const Text("搜索"),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
                elevation: MaterialStateProperty.all(0.0)),
          )),
      onTap: () {
        Get.toNamed("/search_orders");
      },
    ),
  );
}