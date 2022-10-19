import 'package:flutter/material.dart';

import 'item.dart';

class CartPage extends StatefulWidget {
  final List<Item> cart;
  final Function(List<Item>) onCartUpdated;

  const CartPage({super.key, required this.cart, required this.onCartUpdated});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart (${widget.cart.length})'),
      ),
      body: ListView(
        children: widget.cart
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
                              widget.onCartUpdated(widget.cart);
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text('${e.qty}'),
                        IconButton(
                          onPressed: () {
                            e.incrementQty();
                            setState(() {});
                            widget.onCartUpdated(widget.cart);
                          },
                          icon: const Icon(Icons.add_circle_outline),
                        )
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    widget.cart.remove(e);
                    setState(() {});
                    widget.onCartUpdated(widget.cart);
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
