import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'counter_state.dart';

void main() {
  runApp(
    StoreProvider<CounterState>(
      store: store,
      child: const MyApp(),
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
            StoreConnector<CounterState, String>(
                converter: (store) => store.state.counter.toString(),
                builder: (context, count) {
                  return Text(
                    count,
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.dispatch(Actions.increment),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

enum Actions { increment, decrement }

CounterState counterReducer(CounterState state, dynamic action) {
  if (action == Actions.increment) {
    return CounterState(counter: state.counter + 1);
  }
  if (action == Actions.decrement) {
    return CounterState(counter: state.counter - 1);
  }

  return state;
}

final store = Store<CounterState>(counterReducer, initialState: CounterState());
