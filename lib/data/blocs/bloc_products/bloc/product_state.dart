part of 'product_bloc.dart';

abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductModel> product;

  ProductSuccess({required this.product});
}

class ProductError extends ProductState {
  final String error;

  ProductError({required this.error});
}
