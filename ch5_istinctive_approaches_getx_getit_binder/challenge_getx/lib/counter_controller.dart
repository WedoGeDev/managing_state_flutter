import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'counter.dart';

class CounterController extends GetxController {
  var counter = (Counter(count: 0)).obs;

  void increment() {
    log('message');
    counter.value.count++;
    update();
  }
}
