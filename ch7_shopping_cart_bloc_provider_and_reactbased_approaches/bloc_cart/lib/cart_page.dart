import 'package:bloc_cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<CartBloc>(context),
        builder: (context, snapshot) {
          if (snapshot is CartState) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Your cart (${snapshot.cart.length})'),
              ),
              body: ListView(
                children: snapshot.cart
                    .map(
                      (e) => ListTile(
                        title: Text(e.name ?? ''),
                        subtitle: Text('USD ${e.price ?? ''}'),
                        trailing: IconButton(
                          onPressed: () {
                            BlocProvider.of<CartBloc>(context)
                                .add(RemoveItemToCartEvent(item: e));
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
          } else {
            return Container();
          }
        });
  }
}
