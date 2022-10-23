import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart (${cart.cart.length})'),
        ),
        body: ListView(
          children: cart.cart
              .map(
                (e) => ListTile(
                  title: Text(e.name ?? ''),
                  subtitle: Text('USD ${e.price ?? ''}'),
                  trailing: IconButton(
                      onPressed: () {
                        cart.removeItemFromCart(e);
                      },
                      icon: const Icon(Icons.remove)),
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
