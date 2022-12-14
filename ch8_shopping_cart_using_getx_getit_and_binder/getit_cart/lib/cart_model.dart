import 'package:flutter/material.dart';
import 'package:getit_cart/item.dart';

import 'main.dart';

class CartModel extends ChangeNotifier {
  List<Item> items = populateItems();
  List<Item> cart = [];

  void addItemToCart(Item item) {
    var newCart = <Item>[];
    newCart.addAll(cart);
    newCart.add(item);
    cart = newCart;
    notifyListeners();
  }

  void removeItemFromCart(Item item) {
    var newCart = <Item>[];
    newCart.addAll(cart);
    newCart.remove(item);
    cart = newCart;
    notifyListeners();
  }

  CartModel() {
    Future.delayed(const Duration(microseconds: 100))
        .then((value) => getIt.signalReady(this));
  }
}
