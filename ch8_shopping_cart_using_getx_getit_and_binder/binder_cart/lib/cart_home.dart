import 'package:binder/binder.dart';
import 'package:binder_cart/cart_model.dart';
import 'package:binder_cart/cart_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final myCartRef = context.watch(cartRef);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BINDER Cart'),
      ),
      body: ListView(
        children: items
            .map(
              (e) => ListTile(
                title: Text(e.name ?? ''),
                subtitle: Text('USD ${e.price ?? ''}'),
                trailing: IconButton(
                  onPressed: () {
                    if (!myCartRef.cart.contains(e)) {
                      context.use(cartViewLogicRef).addToCart(e);
                    } else {
                      context.use(cartViewLogicRef).removeFromCart(e);
                    }
                  },
                  icon: Icon(
                    myCartRef.cart.contains(e)
                        ? Icons.remove
                        : Icons.add_circle,
                  ),
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: myCartRef.cart.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              ),
              label: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text('${myCartRef.cart.length}'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Cart'),
                ],
              ),
            ),
    );
  }
}
