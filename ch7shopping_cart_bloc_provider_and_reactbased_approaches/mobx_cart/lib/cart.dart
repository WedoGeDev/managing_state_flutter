import 'package:mobx/mobx.dart';
import 'package:mobx_cart/item.dart';

part 'cart.g.dart';

class Cart = _Cart with _$Cart;

abstract class _Cart with Store {
  List<Item> items = populateItems();

  @observable
  List<Item> cart = [];

  @action
  void removeItemFromCart(Item item) {
    var newCart = <Item>[];
    newCart.addAll(cart);
    newCart.remove(item);
    cart = newCart;
  }

  @action
  void addItemToCart(Item item) {
    var newCart = <Item>[];
    newCart.addAll(cart);
    newCart.add(item);
    cart = newCart;
  }
}

final Cart cart = Cart();
