import 'package:dartz/dartz.dart';
import 'package:minimalist_shopping_list/core/error/failures/failures.dart';
import 'package:minimalist_shopping_list/features/categories/domain/entities/category_entity.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/create_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/update_category_params.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure, CategoryEntity>> createCategory(
    CreateCategoryParams params,
  );
  Future<Either<Failure, bool>> deleteCategory(String categoryId);
  Future<Either<Failure, CategoryEntity>> updateCategory(
    UpdateCategoryParams params,
  );
  Future<Either<Failure, CategoryEntity>> getCategoryById(String categoryId);
  Future<Either<Failure, List<CategoryEntity>>> getCategoriesByName(
    String name,
  );
}
