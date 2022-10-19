import 'package:challenge_getx/counter_controller.dart';
import 'package:challenge_getx/page_a.dart';
import 'package:challenge_getx/page_b.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
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
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () => Get.to(PageA()),
              child: Text('Go to Page A'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () => Get.to(PageB()),
              child: Text('Go to Page B'),
            )
          ],
        ),
      ),
    );
  }
}
