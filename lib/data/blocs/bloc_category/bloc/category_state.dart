part of 'category_bloc.dart';

abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> category;

  CategorySuccess({required this.category});
}

class CategoryError extends CategoryState {
  final String error;

  CategoryError({required this.error});
}
