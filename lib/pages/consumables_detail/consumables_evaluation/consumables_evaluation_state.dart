import 'package:get/get.dart';

class ConsumablesEvaluationState {
  final _evaluations = [].obs;

  final _pageSize = 8.obs;

  set pageSize(value) => _pageSize.value = value;

  get pageSize => _pageSize.value;

  set evaluations(value) => _evaluations.value = value;

  get evaluations => _evaluations;
}
