import 'package:minimalist_shopping_list/features/categories/domain/params/create_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/update_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/infra/models/category_model.dart';

abstract class LocalCategoriesDatasource {
  Future<List<CategoryModel>> fetchAllCategories();
  Future<CategoryModel> createCategory(CreateCategoryParams params);
  Future<bool> deleteCategory(String categoryId);
  Future<CategoryModel> updateCategory(UpdateCategoryParams params);
  Future<CategoryModel?> fetchCategoryById(String categoryId);
  Future<List<CategoryModel>> fetchCategoriesByName(String name);
}
