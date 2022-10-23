import 'package:flutter/material.dart';
import 'package:provider_cart/item.dart';

class Cart with ChangeNotifier {
  List<Item> _items = populateItems();
  List<Item> _cart = [];

  List<Item> get items => _items;
  List<Item> get cart => _cart;

  void addToCart(Item item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Item item) {
    _cart.remove(item);
    notifyListeners();
  }
}
