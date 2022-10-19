import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:set_state_counter/example_statefull_page.dart';
import 'package:set_state_counter/page_two.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 1;

  void _Navigate() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PageTwo(
            counter: _counter,
            callback: (value) {
              setState(() {
                _counter = value;
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ExampleStatefulPage(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _Navigate,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
