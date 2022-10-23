import 'package:redux/redux.dart';
import 'package:equatable/equatable.dart';
import 'package:redux_cart/axtions.dart';

import 'item.dart';

class CartState extends Equatable {
  final List<Item> cart;

  const CartState({this.cart = const []});

  @override
  List<Object?> get props => [cart];
}

CartState cartReducer(CartState state, dynamic action) {
  if (action is AddItemToCartAction) {
    var updatedCart = <Item>[];
    updatedCart.addAll(state.cart);
    updatedCart.add(action.item);
    return CartState(cart: updatedCart);
  }

  if (action is RemoveItemFromCartAction) {
    var updatedCart = <Item>[];
    updatedCart.addAll(state.cart);
    updatedCart.remove(action.item);
    return CartState(cart: updatedCart);
  }

  return state;
}

final store = Store<CartState>(cartReducer, initialState: const CartState());
final items = populateItems();
