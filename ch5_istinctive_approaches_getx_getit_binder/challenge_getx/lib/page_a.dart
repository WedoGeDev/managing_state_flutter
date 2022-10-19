import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';

import 'counter_controller.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CounterController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Page A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            GetBuilder<CounterController>(
              builder: (controller) {
                return Text(
                  '${controller.counter.value.count}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
