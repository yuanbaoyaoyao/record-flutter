import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeState {

  final _listPage = 0.obs;

  set listPage(value) => _listPage.value = value;

  get listPage => _listPage.value;

  final _sliderValue = 0.0.obs;

  set sliderValue(value) => _sliderValue.value = value;

  get sliderValue => _sliderValue.value;

  final _sliderMaxValue = 0.0.obs;

  set sliderMaxValue(value) => _sliderMaxValue.value = value;

  get sliderMaxValue => _sliderMaxValue.value;
}
