import 'item.dart';

class CartEbent {}

class AddItemToCartEvent extends CartEbent {
  final Item item;

  AddItemToCartEvent({required this.item});
}

class RemoveItemToCartEvent extends CartEbent {
  final Item item;

  RemoveItemToCartEvent({required this.item});
}
