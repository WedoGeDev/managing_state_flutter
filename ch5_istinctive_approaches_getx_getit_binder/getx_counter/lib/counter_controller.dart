import 'package:get/get.dart';
import 'package:getx_counter/counter.dart';

class CounterController extends GetxController {
  var counter = (Counter(count: 0)).obs;

  void increment() {
    counter.value.count++;
    update();
  }
}
