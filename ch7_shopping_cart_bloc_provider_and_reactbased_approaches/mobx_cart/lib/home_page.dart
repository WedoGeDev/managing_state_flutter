import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_cart/cart.dart';
import 'package:mobx_cart/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('MOBX Cart'),
        ),
        body: ListView(
          children: cart.items
              .map(
                (e) => ListTile(
                  title: Text(e.name ?? ''),
                  subtitle: Text('USD ${e.price ?? ''}'),
                  trailing: IconButton(
                      onPressed: () {
                        if (!cart.cart.contains(e)) {
                          cart.addItemToCart(e);
                        } else {
                          cart.removeItemFromCart(e);
                        }
                      },
                      icon: Icon(
                        cart.cart.contains(e) ? Icons.remove : Icons.add_circle,
                      )),
                ),
              )
              .toList(),
        ),
        floatingActionButton: cart.cart.isEmpty
            ? null
            : FloatingActionButton.extended(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CartPage(),
                )),
                label: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Text('${cart.cart.length}'),
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
