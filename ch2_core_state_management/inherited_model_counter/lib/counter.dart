import 'package:flutter/material.dart';

class CounterInheritedWidget extends InheritedModel<int> {
  const CounterInheritedWidget(
      {super.key, required Widget child, required this.data})
      : super(child: child);

  final CounterState data;

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) =>
      child != oldWidget;

  @override
  bool updateShouldNotifyDependent(
      covariant InheritedModel<int> oldWidget, Set<int> dependencies) {
    if (dependencies.contains(1)) {
      return true;
    }
    return false;
  }
}

class Counter extends StatefulWidget {
  final Widget child;
  const Counter({super.key, required this.child});

  static CounterState of(BuildContext context) {
    final CounterState? result = context
        .dependOnInheritedWidgetOfExactType<CounterInheritedWidget>()
        ?.data;

    assert(result != null, 'No content found in context');

    return result!;
  }

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
  int _counterValue = 0;
  int get counterValue => _counterValue;

  incrementValue() => setState(() {
        _counterValue++;
      });

  @override
  Widget build(BuildContext context) {
    return CounterInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}
