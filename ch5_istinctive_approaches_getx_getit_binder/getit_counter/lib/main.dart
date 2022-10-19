import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:getit_counter/counter_model.dart';

final GetIt getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<CounterModel>(CounterModel(), signalsReady: true);
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
  @override
  void initState() {
    getIt
        .isReady<CounterModel>()
        .then((value) => getIt<CounterModel>().addListener((update)));
    super.initState();
  }

  @override
  void dispose() {
    getIt<CounterModel>().removeListener(update);
    super.dispose();
  }

  void update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
        future: getIt.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                      '${getIt<CounterModel>().counter}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: getIt<CounterModel>().incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Waiting for initialization'),
                SizedBox(
                  height: 16,
                ),
                CircularProgressIndicator(),
              ],
            );
          }
        },
      ),
    );
  }
}
