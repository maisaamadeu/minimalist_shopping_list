import 'package:dartz/dartz.dart';

import 'package:minimalist_shopping_list/core/error/failures/failures.dart';
import 'package:minimalist_shopping_list/core/usecase/usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/entities/category_entity.dart';
import 'package:minimalist_shopping_list/features/categories/domain/repositories/categories_repository.dart';

class GetCategoriesByNameUsecase extends UseCase<List<CategoryEntity>, String> {
  final CategoriesRepository repository;

  GetCategoriesByNameUsecase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(String name) async {
    return await repository.getCategoriesByName(name);
  }
}
