import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fake_store_one/data/models/category_model.dart';
import 'package:fake_store_one/data/repository/dio_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<GetCategoryEvent>(_getCategory);
  }
  final DioRepository dioRepository = DioRepository();
  FutureOr<void> _getCategory(
    GetCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      emit(CategoryLoading());

      final List<CategoryModel> category = await dioRepository.getCategory();

      emit(CategorySuccess(category: category));
    } catch (e) {
      emit(CategoryError(error: e.toString()));
    }
  }
}
