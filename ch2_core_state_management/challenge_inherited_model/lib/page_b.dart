import 'package:flutter/material.dart';
import 'counter.dart';

class PageB extends StatefulWidget {
  const PageB({super.key});

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page B'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${InheritedModel.inheritFrom<CounterInheritedModel>(context, aspect: 1)!.data.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => InheritedModel.inheritFrom<CounterInheritedModel>(
                context,
                aspect: 2)!
            .data
            .incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
