import 'package:binder/binder.dart';
import 'package:binder_counter/counter_view_logic.dart';

final counterViewLogicRef = LogicRef(((scope) => CounterViewLogic(scope)));

class CounterModel {
  int count;

  CounterModel({required this.count});
}
