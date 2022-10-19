import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc {
  static get initialState => const CounterState();
  int counterValue = 0;

  CounterBloc() : super(initialState) {
    on<IncrementCounterEvent>(
        (event, emit) => emit(CounterState(count: ++counterValue)));
    on<AddToCounterEvent>((event, emit) {
      counterValue += event.number;
      emit(CounterState(count: counterValue));
    });
  }
}
