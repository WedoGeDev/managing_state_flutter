import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cart/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(cartProvider) as CartModel;
      var cart = state.cart;

      return Scaffold(
        appBar: AppBar(title: Text('Your Cart (${cart.length})')),
        body: ListView(
          children: cart
              .map(
                (e) => ListTile(
                  title: Text(e.name ?? ''),
                  subtitle: Text('USD ${e.price ?? ''}'),
                  trailing: IconButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).removeFromCart(e);
                    },
                    icon: const Icon(Icons.remove),
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
