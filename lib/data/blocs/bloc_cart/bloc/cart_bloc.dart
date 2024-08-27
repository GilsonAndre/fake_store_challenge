import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fake_store_one/data/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<AddProductCart>(_addProcutCart);
    on<RemoveFromProductCart>(_removeProcutFromCart);
  }

  FutureOr<void> _addProcutCart(
    AddProductCart event,
    Emitter<CartState> emit,
  ) {
    final cartList = List<ProductModel>.from(state.productId)
      ..add(event.productId);

    emit(CartState(cartList));
  }

  FutureOr<void> _removeProcutFromCart(
    RemoveFromProductCart event,
    Emitter<CartState> emit,
  ) {
    final cartList =
        List<ProductModel>.from(state.productId)..remove(event.productId);

    emit(CartState(cartList));
  }
}
