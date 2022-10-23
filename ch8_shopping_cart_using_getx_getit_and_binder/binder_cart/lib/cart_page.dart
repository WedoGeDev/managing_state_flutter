import 'package:binder/binder.dart';
import 'package:flutter/material.dart';

import 'cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myCartRef = context.watch(cartRef);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart (${myCartRef.cart.length})'),
      ),
      body: ListView(
        children: myCartRef.cart
            .map(
              (e) => ListTile(
                title: Text(e.name ?? ''),
                subtitle: Text('USD ${e.price ?? ''}'),
                trailing: IconButton(
                  onPressed: () {
                    context.use(cartViewLogicRef).removeFromCart(e);
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
