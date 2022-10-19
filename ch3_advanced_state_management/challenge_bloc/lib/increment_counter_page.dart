import 'package:challenge_bloc/counter_event.dart';
import 'package:challenge_bloc/counter_state.dart';
import 'package:challenge_bloc/increment_counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementCounterPage extends StatelessWidget {
  const IncrementCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Increment Counter Page'),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<IncrementCounterBloc>(context)
            .add(IncrementCounterEvent()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
