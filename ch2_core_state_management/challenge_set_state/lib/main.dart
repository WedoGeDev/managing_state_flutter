import 'package:challenge_set_state/page_a.dart';
import 'package:challenge_set_state/page_b.dart';
import 'package:flutter/material.dart';

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

  void _navegarAPaginaA() async {
    var valor = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PageA(counter: _counter),
      ),
    );

    if (valor != null) {
      setState(() {
        _counter = valor;
      });
    }
  }

  void _navegarAPaginaB() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PageB(
          counter: _counter,
          callback: (valor) => setState(() {
            _counter = valor;
          }),
        ),
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
              'Veces que haz presionado el botón:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: _navegarAPaginaA,
              child: Text('Ir a Página A'),
            ),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: _navegarAPaginaB,
              child: Text('Ir a Página B'),
            ),
          ],
        ),
      ),
    );
  }
}
