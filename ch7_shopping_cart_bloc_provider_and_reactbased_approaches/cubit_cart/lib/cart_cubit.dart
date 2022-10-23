import 'package:cubit_cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'item.dart';

class CartCubit extends Cubit<CartState> {
  static get initialState => CartListState();
  final List<Item> cart = [];
  final List<Item> items = populateItems();

  CartCubit() : super(initialState);

  addItemToCart(Item item) async {
    emit(CartUpdatingState());
    cart.add(item);
    emit(CartListState(cart: cart));
  }

  removeItemFromCart(Item item) async {
    emit(CartUpdatingState());
    cart.remove(item);
    emit(CartListState(cart: cart));
  }
}
