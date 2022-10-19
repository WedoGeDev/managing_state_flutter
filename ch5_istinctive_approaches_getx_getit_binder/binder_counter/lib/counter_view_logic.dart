import 'package:binder/binder.dart';
import 'package:binder_counter/counter_model.dart';
import 'package:binder_counter/main.dart';

class CounterViewLogic with Logic {
  @override
  final Scope scope;

  CounterViewLogic(this.scope);

  void increment() {
    var counter = CounterModel(count: ++read(counterRef).count);
    write(counterRef, counter);
  }
}
