import 'package:flutter/material.dart';

import 'cart_model.dart';
import 'main.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    getIt
        .isReady<CartModel>()
        .then((value) => getIt<CartModel>().addListener(update));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = getIt<CartModel>();
    var cart = model.cart;

    return FutureBuilder(
      future: getIt.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Your Cart (${cart.length})'),
            ),
            body: ListView(
              children: cart
                  .map(
                    (e) => ListTile(
                      title: Text(e.name ?? ''),
                      subtitle: Text('USD ${e.price ?? ''}'),
                      trailing: IconButton(
                        onPressed: () {
                          model.removeItemFromCart(e);
                        },
                        icon: const Icon(
                          Icons.remove,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Waiting fo initialization'),
            SizedBox(height: 16),
            CircularProgressIndicator(),
          ],
        );
      },
    );
  }

  void update() => setState(() {});
}
