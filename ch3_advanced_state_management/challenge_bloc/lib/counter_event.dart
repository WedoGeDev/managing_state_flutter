class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class AddCounterEvent extends CounterEvent {
  final int number;

  AddCounterEvent({required this.number});
}
