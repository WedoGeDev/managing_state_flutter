import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _counterValue = 0;
  int get counter => _counterValue;

  void incrementCounter() {
    _counterValue++;
    notifyListeners();
  }
}
