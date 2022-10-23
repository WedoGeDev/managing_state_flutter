import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cart/cart_model.dart';
import 'package:riverpod_cart/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(cartProvider) as CartModel;
      var items = state.items;
      var cart = state.cart;

      return Scaffold(
        appBar: AppBar(title: const Text('RIVERPOD Cart')),
        body: ListView(
          children: items
              .map(
                (e) => ListTile(
                  title: Text(e.name ?? ''),
                  subtitle: Text('USD ${e.price ?? ''}'),
                  trailing: IconButton(
                    onPressed: () {
                      if (!cart.contains(e)) {
                        ref.read(cartProvider.notifier).addToCart(e);
                      } else {
                        ref.read(cartProvider.notifier).removeFromCart(e);
                      }
                    },
                    icon: Icon(
                        cart.contains(e) ? Icons.remove : Icons.add_circle),
                  ),
                ),
              )
              .toList(),
        ),
        floatingActionButton: cart.isEmpty
            ? null
            : FloatingActionButton.extended(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CartPage(),
                  ),
                ),
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
                    const SizedBox(
                      width: 8,
                    ),
                    const Text('Cart'),
                  ],
                ),
              ),
      );
    });
  }
}
