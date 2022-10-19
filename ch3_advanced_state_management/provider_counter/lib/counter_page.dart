import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            MyText(),
          ],
        ),
      ),
      floatingActionButton: const MyButton(),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${Provider.of<Counter>(context).counter}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Provider.of<Counter>(
        context,
        listen: false,
      ).incrementCounter(),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
