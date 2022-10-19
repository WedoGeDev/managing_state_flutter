import 'package:cubit_counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  static get initialState => const CounterState();
  int counterValue = 0;

  CounterCubit() : super(initialState);

  void increment() async {
    emit(CounterState(counter: ++counterValue));
  }

  void addNumberToCounter(int counter) async {
    counterValue += counter;
    emit(CounterState(counter: counterValue));
  }
}
