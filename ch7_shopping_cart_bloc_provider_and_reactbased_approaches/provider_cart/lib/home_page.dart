import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cart/cart_model.dart';
import 'package:provider_cart/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var items = context.watch<Cart>().items;
    var cart = context.watch<Cart>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PROVIDER Cart'),
      ),
      body: ListView(
        children: items
            .map(
              (e) => ListTile(
                title: Text(e.name ?? ''),
                subtitle: Text('USD ${e.price ?? ''}'),
                trailing: IconButton(
                  onPressed: () {
                    if (cart.contains(e)) {
                      context.read<Cart>().removeFromCart(e);
                    } else {
                      context.read<Cart>().addToCart(e);
                    }
                  },
                  icon:
                      Icon(cart.contains(e) ? Icons.remove : Icons.add_circle),
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
                    builder: (context) => const CartPage(),
                  ),
                );
              },
              label: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: Text('${cart.length}'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Cart'),
                ],
              ),
            ),
    );
  }
}
