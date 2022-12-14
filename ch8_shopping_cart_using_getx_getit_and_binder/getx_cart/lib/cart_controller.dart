import 'package:get/get.dart';
import 'package:getx_cart/item.dart';

class Cart {
  List<Item> items = populateItems();
  List<Item> cart = [];

  Cart({required this.cart});
}

class CartController extends GetxController {
  var cart = (Cart(cart: [])).obs;

  void addItemToCart(Item item) {
    cart.value.cart.add(item);
    update();
  }

  void removeItemFromCart(Item item) {
    cart.value.cart.remove(item);
    update();
  }
}
