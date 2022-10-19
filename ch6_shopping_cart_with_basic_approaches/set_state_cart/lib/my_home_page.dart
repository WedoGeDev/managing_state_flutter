import 'package:flutter/material.dart';
import 'package:set_state_cart/cart_page.dart';

import 'item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Item> items;
  List<Item> cart = [];

  @override
  void initState() {
    _getItems();
    super.initState();
  }

  void _getItems() {
    items = populateItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: items
            .map(
              (e) => ListTile(
                isThreeLine: true,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                title: Text(e.name ?? ''),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('USD ${e.price ?? ''}'),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (e.qty > 1) {
                              e.decrementQty();
                              setState(() {});
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text('${e.qty}'),
                        IconButton(
                          onPressed: () {
                            e.incrementQty();
                            setState(() {});
                          },
                          icon: const Icon(Icons.add_circle_outline),
                        )
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    if (!cart.contains(e)) {
                      cart.add(e);
                    } else {
                      cart.remove(e);
                    }
                    setState(() {});
                  },
                  icon: Icon(
                    cart.contains(e) ? Icons.remove_circle : Icons.add_circle,
                  ),
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: cart.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartPage(
                    cart: cart,
                    onCartUpdated: (items) {
                      cart = items;
                      setState(() {});
                    },
                  ),
                ));
              },
              label: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Text('${cart.length}'),
                  ),
                  const SizedBox(width: 8),
                  const Text('Cart'),
                ],
              ),
            ),
    );
  }
}
