import 'package:challenge_inherited_model/page_a.dart';
import 'package:challenge_inherited_model/page_b.dart';
import 'package:flutter/material.dart';

import 'counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Counter(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${InheritedModel.inheritFrom<CounterInheritedModel>(context, aspect: 1)!.data.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageA(),
                      ));
                },
                child: const Text('Go to Page A')),
            const SizedBox(height: 8.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageB(),
                      ));
                },
                child: const Text('Go to Page B')),
          ],
        ),
      ),
    );
  }
}
