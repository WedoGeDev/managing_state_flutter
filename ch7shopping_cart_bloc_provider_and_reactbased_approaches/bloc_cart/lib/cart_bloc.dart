import 'package:bloc_cart/cart_event.dart';
import 'package:bloc_cart/cart_state.dart';
import 'package:bloc_cart/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc {
  static get initialState => const CartState();
  List<Item> items = populateItems();
  List<Item> cart = [];

  CartBloc() : super(initialState) {
    on<AddItemToCartEvent>(
      (event, emit) {
        emit(CartUpdatingState());
        cart.add(event.item);
        emit(CartState(cart: cart));
      },
    );
    on<RemoveItemToCartEvent>(
      (event, emit) {
        emit(CartUpdatingState());
        cart.remove(event.item);
        emit(CartState(cart: cart));
      },
    );
  }
}
