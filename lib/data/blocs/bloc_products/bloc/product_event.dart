part of 'product_bloc.dart';

abstract class ProductEvent {
  const ProductEvent();
}

class GetProductEvent extends ProductEvent {}
