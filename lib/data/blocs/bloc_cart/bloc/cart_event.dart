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
