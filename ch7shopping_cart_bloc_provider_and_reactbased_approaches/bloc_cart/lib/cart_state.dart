import 'package:equatable/equatable.dart';

import 'item.dart';

class CartState extends Equatable {
  final List<Item> cart;

  const CartState({this.cart = const []});

  @override
  List<Object?> get props => [cart];
}

class CartUpdatingState {}
