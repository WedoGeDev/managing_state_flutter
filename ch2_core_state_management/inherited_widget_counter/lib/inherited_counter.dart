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
  const Counter({super.key, required this.child});
  final Widget child;

  static CounterState of(BuildContext context) {
    final CounterState? result = context
        .dependOnInheritedWidgetOfExactType<CounterInheritedWidget>()
        ?.data;

    assert(result != null, 'No counter found in context.');

    return result!;
  }

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
  int _counterValue = 0;

  int get counterValue => _counterValue;

  void incrementValue() => setState(() {
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
