import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:getit_cart/cart_model.dart';

import 'home_page.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<CartModel>(CartModel(), signalsReady: true);
  runApp(const MyApp());
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
