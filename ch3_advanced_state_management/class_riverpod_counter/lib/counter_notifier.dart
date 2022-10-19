import 'package:class_riverpod_counter/counter_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<CounterModel> {
  CounterNotifier() : super(CounterModel(count: 0));

  void increment() => state = CounterModel(count: state.count + 1);
}
