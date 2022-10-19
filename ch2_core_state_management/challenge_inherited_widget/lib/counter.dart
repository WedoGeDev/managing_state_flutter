import 'package:flutter/material.dart';

class CounterInheritedWidget extends InheritedWidget {
  final CounterState data;
  const CounterInheritedWidget(
      {super.key, required Widget child, required this.data})
      : super(child: child);

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) =>
      child != oldWidget;
}

class Counter extends StatefulWidget {
  final Widget child;
  const Counter({
    super.key,
    required this.child,
  });

  static CounterState of(BuildContext context) {
    final CounterState? res = context
        .dependOnInheritedWidgetOfExactType<CounterInheritedWidget>()
        ?.data;
    assert(res != null, 'Conunter not found in context');

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
    return CounterInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}
