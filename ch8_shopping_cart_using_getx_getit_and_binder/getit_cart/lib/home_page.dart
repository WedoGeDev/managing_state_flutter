import 'package:flutter/material.dart';
import 'package:getit_cart/cart_model.dart';
import 'package:getit_cart/main.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              title: const Text('GET_IT Cart'),
            ),
            body: ListView(
              children: getIt<CartModel>()
                  .items
                  .map(
                    (e) => ListTile(
                      title: Text(e.name ?? ''),
                      subtitle: Text('USD ${e.price ?? ''}'),
                      trailing: IconButton(
                        onPressed: () {
                          if (!cart.contains(e)) {
                            model.addItemToCart(e);
                          } else {
                            model.removeItemFromCart(e);
                          }
                        },
                        icon: Icon(
                          cart.contains(e) ? Icons.remove : Icons.add_circle,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            floatingActionButton: cart.isEmpty
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
                          child: Text('${cart.length}'),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('Cart')
                      ],
                    ),
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
