part of 'product_bloc.dart';

abstract class ProductEvent {
  ProductEvent();
}

class GetProductEvent extends ProductEvent {}
