import 'package:flutter/material.dart';

class PageA extends StatefulWidget {
  int counter;

  PageA({required this.counter});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  void _incrementCounter() {
    setState(() {
      widget.counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página A'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(widget.counter);
          },
        ),
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
