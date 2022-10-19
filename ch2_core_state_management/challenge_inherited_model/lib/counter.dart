import 'package:flutter/material.dart';

class CounterInheritedModel extends InheritedModel<int> {
  final CounterState data;

  const CounterInheritedModel(
      {super.key, required Widget child, required this.data})
      : super(child: child);

  @override
  bool updateShouldNotify(CounterInheritedModel oldWidget) =>
      child != oldWidget;

  @override
  bool updateShouldNotifyDependent(
          covariant InheritedModel<int> oldWidget, Set<int> dependencies) =>
      dependencies.contains(1);
}

class Counter extends StatefulWidget {
  final Widget child;
  const Counter({super.key, required this.child});

  static CounterState of(BuildContext context) {
    final CounterState? res = context
        .dependOnInheritedWidgetOfExactType<CounterInheritedModel>()
        ?.data;

    assert(res != null, 'Counter not found in context');
    return res!;
  }

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
  int _counterValue = 0;
  int get counter => _counterValue;

  incrementCounter() => setState(() {
        _counterValue++;
      });

  @override
  Widget build(BuildContext context) {
    return CounterInheritedModel(
      data: this,
      child: widget.child,
    );
  }
}
