import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/counter.dart';
import 'package:provider_counter/counter_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider<Counter>(
      child: const MyApp(),
      create: (context) => Counter(),
    ),
  );
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
      home: const CounterPage(),
    );
  }
}
