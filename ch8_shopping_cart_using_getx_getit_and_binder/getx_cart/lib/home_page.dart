import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_cart/cart_page.dart';

import 'cart_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CartController controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'GETX Cart',
            ),
          ),
          body: ListView(
            children: controller.cart.value.items
                .map(
                  (e) => ListTile(
                    title: Text(e.name ?? ''),
                    subtitle: Text('USD ${e.price ?? ''}'),
                    trailing: IconButton(
                      onPressed: () {
                        if (!controller.cart.value.cart.contains(e)) {
                          controller.addItemToCart(e);
                        } else {
                          controller.removeItemFromCart(e);
                        }
                      },
                      icon: Icon(
                        controller.cart.value.cart.contains(e)
                            ? Icons.remove
                            : Icons.add_circle,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          floatingActionButton: controller.cart.value.cart.isEmpty
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
                        child: Text('${controller.cart.value.cart.length}'),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text('Cart'),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
