import 'package:challenge_bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_counter_bloc.dart';
import 'counter_state.dart';

class AddCounterPage extends StatelessWidget {
  const AddCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<AddCounterBloc>(context)
            .add(AddCounterEvent(number: 10)),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
