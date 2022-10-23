import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CartController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Your Cart (${controller.cart.value.cart.length})',
            ),
          ),
          body: ListView(
            children: controller.cart.value.cart
                .map(
                  (e) => ListTile(
                    title: Text(e.name ?? ''),
                    subtitle: Text('USD ${e.price ?? ''}'),
                    trailing: IconButton(
                      onPressed: () {
                        controller.removeItemFromCart(e);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
