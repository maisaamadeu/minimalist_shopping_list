import 'package:minimalist_shopping_list/features/categories/domain/entities/category_entity.dart';

sealed class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryEntity> categories;

  CategoriesLoaded(this.categories);
}

class CategoriesActionSuccess extends CategoriesState {}

class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError(this.message);
}
