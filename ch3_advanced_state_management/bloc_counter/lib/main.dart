import 'package:bloc_counter/counter_bloc.dart';
import 'package:bloc_counter/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(),
          ),
        ],
        child: const CounterPage(),
      ),
    );
  }
}
