import 'package:cubit_cart/item.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartListState extends CartState {
  final List<Item> cart;

  CartListState({this.cart = const []});

  @override
  List<Object?> get props => [cart];
}

class CartUpdatingState extends CartState {}
