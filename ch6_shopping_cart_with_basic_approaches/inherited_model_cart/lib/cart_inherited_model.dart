import 'package:flutter/material.dart';

import 'item.dart';

class Cart extends StatefulWidget {
  final Widget child;

  const Cart({super.key, required this.child});

  static CartState of(BuildContext context) {
    final CartState result =
        context.dependOnInheritedWidgetOfExactType<CartInheritedModel>()!.data;

    return result;
  }

  @override
  State<Cart> createState() => CartState();
}

class CartState extends State<Cart> {
  final List<Item> _items = populateItems();
  final List<Item> _cart = [];

  List<Item> get items => _items;
  List<Item> get cart => _cart;

  void addToCart(Item item) {
    _cart.add(item);
    setState(() {});
  }

  void removeFromCart(Item item) {
    _cart.remove(item);
    setState(() {});
  }

  void incrementQtyOfItem(Item item) {
    item.incrementQty();
    setState(() {});
  }

  void decrementQtyOfItem(Item item) {
    item.decrementQty();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CartInheritedModel(
      data: this,
      child: widget.child,
    );
  }
}

class CartInheritedModel extends InheritedModel<List<Item>> {
  final CartState data;

  const CartInheritedModel(
      {super.key, required super.child, required this.data});

  @override
  bool updateShouldNotify(CartInheritedModel oldWidget) => child != oldWidget;

  @override
  bool updateShouldNotifyDependent(
      covariant InheritedModel<List<Item>> oldWidget,
      Set<List<Item>> dependencies) {
    return dependencies.contains(1);
  }
}
