import 'package:challenge_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';

class IncrementCounterBloc extends Bloc<CounterEvent, CounterState> {
  static get initialState => const CounterState();
  int counterValue = 0;

  IncrementCounterBloc() : super(initialState) {
    on<IncrementCounterEvent>(
        (event, emit) => emit(CounterState(counter: ++counterValue)));
  }
}
