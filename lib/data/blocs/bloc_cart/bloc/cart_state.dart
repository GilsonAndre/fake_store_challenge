part of 'cart_bloc.dart';

class CartState {
  final List<ProductModel> productId;
  final int cartList;
  CartState(this.productId, {this.cartList = 0});

  CartState copyWith({
    List<ProductModel>? productId,
    int? cartList,
  }) {
    return CartState(
      productId ?? this.productId,
      cartList: cartList ?? this.cartList,
    );
  }
}
