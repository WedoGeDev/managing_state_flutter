import 'package:bloc_counter/counter_bloc.dart';
import 'package:bloc_counter/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

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
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder(
              builder: (context, state) {
                return Text(
                  '${(state as CounterState).count}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
              bloc: BlocProvider.of<CounterBloc>(context),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc>(context)
                .add(IncrementCounterEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc>(context)
                .add(AddToCounterEvent(number: 5)),
            tooltip: 'Add Five',
            child: const Icon(Icons.add_a_photo),
          ),
        ],
      ),
    );
  }
}
