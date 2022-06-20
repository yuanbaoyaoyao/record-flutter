import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeState {
  final tabsKey = GlobalKey();

  final _showTab = false.obs;

  List tabs = ["第一button", "第二button", "第三button", "第四button"];

  List rotations = [];

  final _listPage = 0.obs;
  final _tabsSliderValue = 0.0.obs;
  final _tabsSliderMaxValue = 0.0.obs;

  final _sliderValue = 0.0.obs;
  final _sliderMaxValue = 0.0.obs;

  set showTab(value) => _showTab.value = value;

  get showTab => _showTab.value;

  set listPage(value) => _listPage.value = value;

  get listPage => _listPage.value;

  set sliderValue(value) => _sliderValue.value = value;

  get sliderValue => _sliderValue.value;

  set sliderMaxValue(value) => _sliderMaxValue.value = value;

  get sliderMaxValue => _sliderMaxValue.value;

  set tabsSliderValue(value) => _tabsSliderValue.value = value;

  get tabsSliderValue => _tabsSliderValue.value;

  set tabsSliderMaxValue(value) => _tabsSliderMaxValue.value = value;

  get tabsSliderMaxValue => _tabsSliderMaxValue.value;
}
