import 'package:redux_cart/item.dart';

class Action {}

class AddItemToCartAction extends Action {
  final Item item;

  AddItemToCartAction({required this.item});
}

class RemoveItemFromCartAction extends Action {
  final Item item;

  RemoveItemFromCartAction({required this.item});
}
