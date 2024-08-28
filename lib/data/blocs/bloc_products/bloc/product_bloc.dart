import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fake_store_one/data/models/product_model.dart';
import 'package:fake_store_one/data/repository/dio_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>(_getProducts);
  }
  final DioRepository dioRepository = DioRepository();

  Future<void> _getProducts(
    GetProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductInitial());
    try {
      emit(ProductLoading());
      final List<ProductModel> product = await dioRepository.getAllProducts();
      emit(ProductSuccess(product: product));
    } catch (e) {
      emit(ProductError(error: e.toString()));
    }
  }
  
}
