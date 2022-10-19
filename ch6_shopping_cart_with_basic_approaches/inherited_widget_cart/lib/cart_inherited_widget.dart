import 'package:flutter/material.dart';
import 'package:inherited_widget_cart/item.dart';

class Cart extends StatefulWidget {
  final Widget child;

  const Cart({super.key, required this.child});

  static CartState of(BuildContext context) {
    final CartState result =
        context.dependOnInheritedWidgetOfExactType<CartInheritedWidget>()!.data;

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
    return CartInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class CartInheritedWidget extends InheritedWidget {
  final CartState data;

  const CartInheritedWidget(
      {super.key, required super.child, required this.data});

  @override
  bool updateShouldNotify(CartInheritedWidget oldWidget) => child != oldWidget;
}
