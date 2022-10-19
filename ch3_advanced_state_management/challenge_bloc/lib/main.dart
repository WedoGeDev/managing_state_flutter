import 'package:challenge_bloc/add_counter_bloc.dart';
import 'package:challenge_bloc/increment_counter_bloc.dart';
import 'package:challenge_bloc/increment_counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_counter_page.dart';
import 'counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IncrementCounterBloc>(
          create: (context) => IncrementCounterBloc(),
        ),
        BlocProvider<AddCounterBloc>(
          create: (context) => AddCounterBloc(),
        ),
      ],
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

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times for Increment Counter:',
            ),
            BlocBuilder<IncrementCounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
              bloc: BlocProvider.of(context),
            ),
            const Text(
              'You have pushed the button this many times for Add Counter:',
            ),
            BlocBuilder<AddCounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
              bloc: BlocProvider.of(context),
            ),
            const SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IncrementCounterPage(),
                    ));
              },
              child: const Text('Go to Increment Counter Page'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCounterPage(),
                    ));
              },
              child: const Text('Go to Add Counter Page'),
            ),
          ],
        ),
      ),
    );
  }
}
