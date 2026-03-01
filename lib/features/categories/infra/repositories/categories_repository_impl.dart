import 'package:dartz/dartz.dart';
import 'package:minimalist_shopping_list/core/error/exceptions/exceptions.dart';
import 'package:minimalist_shopping_list/core/error/failures/failures.dart';
import 'package:minimalist_shopping_list/core/error/map_exception.dart';
import 'package:minimalist_shopping_list/features/categories/domain/entities/category_entity.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/create_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/update_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/domain/repositories/categories_repository.dart';
import 'package:minimalist_shopping_list/features/categories/infra/datasources/local/local_categories_datasource.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final LocalCategoriesDatasource localCategoryDatasource;

  CategoriesRepositoryImpl(this.localCategoryDatasource);

  @override
  Future<Either<Failure, CategoryEntity>> createCategory(
    CreateCategoryParams params,
  ) async {
    try {
      final result = await localCategoryDatasource.createCategory(params);
      return Right(result);
    } catch (e) {
      return Left(mapException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCategory(String categoryId) async {
    try {
      final result = await localCategoryDatasource.deleteCategory(categoryId);
      return Right(result);
    } catch (e) {
      return Left(mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      final result = await localCategoryDatasource.fetchAllCategories();
      return Right(result);
    } catch (e) {
      return Left(mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategoriesByName(
    String name,
  ) async {
    try {
      final result = await localCategoryDatasource.fetchCategoriesByName(name);
      return Right(result);
    } catch (e) {
      return Left(mapException(e));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(
    String categoryId,
  ) async {
    try {
      final result = await localCategoryDatasource.fetchCategoryById(
        categoryId,
      );

      if (result == null) throw NotFoundException();

      return Right(result);
    } catch (e) {
      return Left(mapException(e));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> updateCategory(
    UpdateCategoryParams params,
  ) async {
    try {
      final result = await localCategoryDatasource.updateCategory(params);
      return Right(result);
    } catch (e) {
      return Left(mapException(e));
    }
  }
}
