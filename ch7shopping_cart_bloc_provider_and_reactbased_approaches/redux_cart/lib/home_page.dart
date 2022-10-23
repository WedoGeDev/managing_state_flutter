import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_cart/axtions.dart';
import 'package:redux_cart/cart_page.dart';
import 'package:redux_cart/cart_state.dart';
import 'package:redux_cart/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CartState, List<Item>>(
        converter: (store) => store.state.cart,
        builder: (context, cart) {
          return Scaffold(
            appBar: AppBar(title: const Text('REDUX Cart')),
            body: ListView(
              children: items
                  .map(
                    (e) => ListTile(
                      title: Text(e.name ?? ''),
                      subtitle: Text('USD ${e.price ?? ''}'),
                      trailing: IconButton(
                          onPressed: () {
                            if (!cart.contains(e)) {
                              store.dispatch(AddItemToCartAction(item: e));
                            } else {
                              store.dispatch(RemoveItemFromCartAction(item: e));
                            }
                          },
                          icon: Icon(cart.contains(e)
                              ? Icons.remove
                              : Icons.add_circle)),
                    ),
                  )
                  .toList(),
            ),
            floatingActionButton: cart.isEmpty
                ? null
                : FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ));
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
