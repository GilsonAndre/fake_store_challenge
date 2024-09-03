part of 'cart_bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddProductCart extends CartEvent {
  final ProductModel productId;

  AddProductCart(this.productId);
}

class RemoveFromProductCart extends CartEvent {
  final ProductModel productId;

  RemoveFromProductCart(this.productId);
}

class SumFromProductCart extends CartEvent {
  final int cartList;

  SumFromProductCart(this.cartList);
}

class MinusFromProductCart extends CartEvent {
  final int cartList;

  MinusFromProductCart(this.cartList);
}
