import 'package:dartz/dartz.dart';

import 'package:minimalist_shopping_list/core/error/failures/failures.dart';
import 'package:minimalist_shopping_list/core/usecase/usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/entities/category_entity.dart';
import 'package:minimalist_shopping_list/features/categories/domain/repositories/categories_repository.dart';

class GetCategoryByIdUsecase extends UseCase<CategoryEntity, String> {
  final CategoriesRepository repository;

  GetCategoryByIdUsecase(this.repository);

  @override
  Future<Either<Failure, CategoryEntity>> call(String categoryId) async {
    return await repository.getCategoryById(categoryId);
  }
}
