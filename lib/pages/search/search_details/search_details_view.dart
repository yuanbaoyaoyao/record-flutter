import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/widgets/red_dot_page.dart';
import 'search_details_logic.dart';

final logic = Get.find<SearchDetailsLogic>();
final state = Get.find<SearchDetailsLogic>().state;

class SearchDetailsPage extends GetView<SearchDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context , child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: rightCatePageView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            print("点击了购物车");
            Get.toNamed("/cart");
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.shopping_cart,
            key: state.oldNewCartKey,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget rightCatePageView() {
    return SingleChildScrollView(
      child: Column(
        children: _buildConsumables(),
      ),
    );
  }

  List<Widget> _buildConsumables() => List.generate(8, (index) {
        final logic = Get.find<SearchDetailsLogic>();
        return GestureDetector(
          child: Row(
            children: [
              Image.asset(
                "assets/images/mock/88a1.png",
                width: 100.0,
                fit: BoxFit.fill,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("标题"),
                  Text("描述"),
                  Row(
                    children: [
                      Text("数量"),
                      Expanded(child: Text("")),
                      Builder(
                        builder: (context) {
                          return IconButton(
                              onPressed: () {
                                print("点击了添加按钮");
                                OverlayEntry? _overlayEntry =
                                    OverlayEntry(builder: (_) {
                                  RenderBox? box =
                                      context.findRenderObject() as RenderBox?;
                                  var offset = box!.localToGlobal(Offset.zero);
                                  return RedDotPage(
                                      startPosition: offset,
                                      endPosition: logic.endOffset);
                                });
                                Overlay.of(context)?.insert(_overlayEntry);
                                Future.delayed(Duration(milliseconds: 800), () {
                                  _overlayEntry?.remove();
                                  _overlayEntry = null;
                                });
                              },
                              icon: Icon(Icons.add_circle_outline));
                        },
                      )
                    ],
                  )
                ],
              )),
            ],
          ),
          onTap: () {
            Get.toNamed("/consumables_detail");
          },
        );
      });
}

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
              print("点击了搜索");
              Get.toNamed("/search");
            },
            icon: const Icon(Icons.search_outlined),
            label: const Text("搜索"),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
                elevation: MaterialStateProperty.all(0.0)),
          )),
      onTap: () {
        print("点击了title");
        Get.toNamed("/search");
      },
    ),
    bottom: TabBar(
        controller: logic.tabController,
        isScrollable: false,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: _buildTabsItemsList()),
  );
}

List<Widget> _buildTabsItemsList() => List.generate(4, (index) {
      return Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text("${state.tabs[index]}"),
      );
    });
