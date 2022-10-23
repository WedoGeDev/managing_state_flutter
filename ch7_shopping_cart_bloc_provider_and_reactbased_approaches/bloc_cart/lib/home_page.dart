import 'package:bloc_cart/cart_bloc.dart';
import 'package:bloc_cart/cart_event.dart';
import 'package:bloc_cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = BlocProvider.of<CartBloc>(context).items;

    return BlocBuilder(
        bloc: BlocProvider.of<CartBloc>(context),
        builder: (context, snapshot) {
          var cart = (snapshot as CartState).cart;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
            ),
            body: ListView(
              children: items
                  .map(
                    (e) => ListTile(
                      title: Text(e.name ?? ''),
                      subtitle: Text('USD ${e.price ?? ''}'),
                      trailing: IconButton(
                        onPressed: () {
                          if (!cart.contains(e)) {
                            BlocProvider.of<CartBloc>(context)
                                .add(AddItemToCartEvent(item: e));
                          } else {
                            BlocProvider.of<CartBloc>(context)
                                .add(RemoveItemToCartEvent(item: e));
                          }
                        },
                        icon: Icon(
                          cart.contains(e)
                              ? Icons.remove_circle
                              : Icons.add_circle,
                        ),
                      ),
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
                          child: Text('${snapshot.cart.length}'),
                        ),
                        const SizedBox(width: 8),
                        const Text('Cart'),
                      ],
                    ),
                  ),
          );
        });
  }
}
