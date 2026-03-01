import 'package:minimalist_shopping_list/features/categories/domain/params/create_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/delete_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/update_category_params.dart';

sealed class CategoriesEvent {}

class LoadCategoriesRequested extends CategoriesEvent {}

class CreateCategoryRequested extends CategoriesEvent {
  final CreateCategoryParams params;

  CreateCategoryRequested(this.params);
}

class UpdateCategoryRequested extends CategoriesEvent {
  final UpdateCategoryParams params;

  UpdateCategoryRequested(this.params);
}

class DeleteCategoryRequested extends CategoriesEvent {
  final DeleteCategoryParams params;

  DeleteCategoryRequested(this.params);
}
