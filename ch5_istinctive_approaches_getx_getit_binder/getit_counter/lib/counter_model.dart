import 'package:flutter/material.dart';

import 'main.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  CounterModel() {
    Future.delayed(const Duration(microseconds: 100))
        .then((value) => getIt.signalReady(this));
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
