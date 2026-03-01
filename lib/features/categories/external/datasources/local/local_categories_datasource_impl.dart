import 'package:minimalist_shopping_list/core/cache/database/local_database.dart';
import 'package:minimalist_shopping_list/core/cache/database/local_database_keys.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/create_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/update_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/infra/datasources/local/local_categories_datasource.dart';
import 'package:minimalist_shopping_list/features/categories/infra/models/category_model.dart';

class LocalCategoriesDatasourceImpl implements LocalCategoriesDatasource {
  final LocalDatabase database;

  LocalCategoriesDatasourceImpl(this.database);

  @override
  Future<CategoryModel> createCategory(CreateCategoryParams params) async {
    final createdAt = DateTime.now();

    await database.insert(LocalDatabaseKeys.categories, {
      'id': params.id,
      'name': params.name,
      'image_path': params.image?.path,
      'created_at': createdAt.millisecondsSinceEpoch,
    });

    return CategoryModel(
      id: params.id,
      name: params.name,
      imagePath: params.image?.path,
      createdAt: createdAt,
    );
  }

  @override
  Future<bool> deleteCategory(String categoryId) async {
    await database.delete(
      LocalDatabaseKeys.categories,
      where: 'id = ?',
      args: [categoryId],
    );
    return true;
  }

  @override
  @override
  Future<List<CategoryModel>> fetchAllCategories() async {
    final result = await database.query(LocalDatabaseKeys.categories);
    return result.map((map) => CategoryModel.fromMap(map)).toList();
  }

  @override
  Future<List<CategoryModel>> fetchCategoriesByName(String name) async {
    final result = await database.query(
      LocalDatabaseKeys.categories,
      where: 'name LIKE ?',
      args: ['%$name%'],
    );
    return result.map((map) => CategoryModel.fromMap(map)).toList();
  }

  @override
  Future<CategoryModel?> fetchCategoryById(String categoryId) async {
    final result = await database.query(
      LocalDatabaseKeys.categories,
      where: 'id = ?',
      args: [categoryId],
    );
    if (result.isEmpty) return null;
    return CategoryModel.fromMap(result.first);
  }

  @override
  Future<CategoryModel> updateCategory(UpdateCategoryParams params) async {
    await database.update(
      LocalDatabaseKeys.categories,
      {'name': params.name, 'image_path': params.image?.path},
      where: 'id = ?',
      args: [params.id],
    );

    final updatedCategory = await fetchCategoryById(params.id);

    if (updatedCategory != null) {
      return updatedCategory;
    }

    return CategoryModel(
      id: params.id,
      name: params.name,
      imagePath: params.image?.path,
      createdAt: DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
