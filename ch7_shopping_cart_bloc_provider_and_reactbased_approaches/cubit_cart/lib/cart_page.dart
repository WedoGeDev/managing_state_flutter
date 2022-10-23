import 'package:cubit_cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<CartCubit>(context),
        builder: (context, snapshot) {
          if (snapshot is CartListState) {
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
                            BlocProvider.of<CartCubit>(context)
                                .removeItemFromCart(e);
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
