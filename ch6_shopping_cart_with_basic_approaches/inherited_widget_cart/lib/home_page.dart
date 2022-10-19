import 'package:flutter/material.dart';
import 'cart_inherited_widget.dart';
import 'cart_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final items = Cart.of(context).items;
    final cart = Cart.of(context).cart;

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
                              Cart.of(context).decrementQtyOfItem(e);
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text('${e.qty}'),
                        IconButton(
                          onPressed: () {
                            Cart.of(context).incrementQtyOfItem(e);
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
                      Cart.of(context).addToCart(e);
                    } else {
                      Cart.of(context).removeFromCart(e);
                    }
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
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
