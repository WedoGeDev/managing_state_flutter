import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class AddCounterBloc extends Bloc<CounterEvent, CounterState> {
  static get initialState => const CounterState();
  int counterValue = 0;

  AddCounterBloc() : super(initialState) {
    on<AddCounterEvent>((event, emit) {
      counterValue += event.number;
      emit(CounterState(counter: counterValue));
    });
  }
}
