import 'package:flutter/material.dart';

import 'counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Counter(
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    print('MyText build');

    return Text(
      InheritedModel.inheritFrom<CounterInheritedWidget>(context, aspect: 1)!
          .data
          .counterValue
          .toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    print('MyFloatingActionButton build');
    return FloatingActionButton(
      onPressed: () {
        InheritedModel.inheritFrom<CounterInheritedWidget>(context, aspect: 2)!
            .data
            .incrementValue();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
