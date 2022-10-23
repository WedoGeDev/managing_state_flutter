import 'package:binder/binder.dart';
import 'package:binder_cart/item.dart';

List<Item> items = populateItems();
final cartRef = StateRef(CartModel(cart: []));
final cartViewLogicRef = LogicRef(((scope) => CartViewLogic(scope)));

class CartModel {
  List<Item> cart;

  CartModel({required this.cart});
}

class CartViewLogic with Logic {
  @override
  final Scope scope;

  CartViewLogic(this.scope);

  void addToCart(Item item) {
    read(cartRef).cart.add(item);
    var updatedCart = CartModel(cart: read(cartRef).cart);
    write(cartRef, updatedCart);
  }

  void removeFromCart(Item item) {
    read(cartRef).cart.remove(item);
    var updatedCart = CartModel(cart: read(cartRef).cart);
    write(cartRef, updatedCart);
  }
}
