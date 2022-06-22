import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeState {
  final tabsKey = GlobalKey();

  final _showTab = false.obs;

  List tabs = ["打印机相关", "显示器电脑", "电脑周边", "其他"];

  List buttonNames = ["打印机相关", "显示器电脑", "电脑周边", "其他"];

  final _products = [].obs;
  final _rotations = [].obs;
  final _oldProducts = [].obs;
  final _newProducts = [].obs;

  final _listPage = 0.obs;
  final _tabsSliderValue = 0.0.obs;
  final _tabsSliderMaxValue = 0.0.obs;

  final _sliderValue = 0.0.obs;
  final _sliderMaxValue = 0.0.obs;

  set products(value) => _products.value = value;

  get products => _products;

  set rotations(value) => _rotations.value = value;

  get rotations => _rotations;

  set oldProducts(value) => _oldProducts.value = value;

  get oldProducts => _oldProducts;

  set newProducts(value) => _newProducts.value = value;

  get newProducts => _newProducts;

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
