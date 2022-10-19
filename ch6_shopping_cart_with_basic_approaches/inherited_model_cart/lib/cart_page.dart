import 'package:flutter/material.dart';

import 'cart_inherited_model.dart';

class CartPage extends StatefulWidget {
  const CartPage();

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Cart.of(context).cart;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart (${cart.length})'),
      ),
      body: ListView(
        children: cart
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
                              InheritedModel.inheritFrom<CartInheritedModel>(
                                      context,
                                      aspect: 1)!
                                  .data
                                  .decrementQtyOfItem(e);
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text('${e.qty}'),
                        IconButton(
                          onPressed: () {
                            InheritedModel.inheritFrom<CartInheritedModel>(
                                    context,
                                    aspect: 1)!
                                .data
                                .incrementQtyOfItem(e);
                          },
                          icon: const Icon(Icons.add_circle_outline),
                        )
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    InheritedModel.inheritFrom<CartInheritedModel>(context)!
                        .data
                        .removeFromCart(e);
                  },
                  icon: const Icon(Icons.remove_circle),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
