import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'axtions.dart';
import 'cart_state.dart';
import 'item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CartState, List<Item>>(
        converter: (store) => store.state.cart,
        builder: (context, cart) {
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
                            store.dispatch(RemoveItemFromCartAction(item: e));
                          },
                          icon: const Icon(Icons.add_circle)),
                    ),
                  )
                  .toList(),
            ),
          );
        });
  }
}
