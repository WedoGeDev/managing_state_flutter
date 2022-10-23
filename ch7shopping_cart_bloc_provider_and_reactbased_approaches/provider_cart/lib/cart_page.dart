import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>().cart;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart (${cart.length})'),
      ),
      body: ListView(
        children: cart
            .map(
              (e) => ListTile(
                title: Text(e.name ?? ''),
                subtitle: Text('USD ${e.price ?? ''}'),
                trailing: IconButton(
                  onPressed: () {
                    context.read<Cart>().removeFromCart(e);
                  },
                  icon: const Icon(Icons.remove),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
