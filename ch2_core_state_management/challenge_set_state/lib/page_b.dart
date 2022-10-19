import 'package:flutter/material.dart';

class PageB extends StatefulWidget {
  int counter;
  final Function(int) callback;
  PageB({required this.counter, required this.callback});

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  void _incrementCounter() {
    setState(() {
      widget.counter++;
    });
    widget.callback(widget.counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página B'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Veces que haz presionado el botón:',
            ),
            Text(
              '${widget.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
