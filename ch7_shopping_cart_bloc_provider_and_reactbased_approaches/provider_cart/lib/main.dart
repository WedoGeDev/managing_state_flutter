import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cart/cart_model.dart';

import 'home_page.dart';

void main() {
  runApp(ChangeNotifierProvider<Cart>(
    child: const MyApp(),
    create: (context) => Cart(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
