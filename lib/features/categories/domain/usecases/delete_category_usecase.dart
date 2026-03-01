import 'package:dartz/dartz.dart';
import 'package:minimalist_shopping_list/core/domain/services/image_storage_service.dart';

import 'package:minimalist_shopping_list/core/error/failures/failures.dart';
import 'package:minimalist_shopping_list/core/usecase/usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/delete_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/domain/repositories/categories_repository.dart';

class DeleteCategoryUsecase extends UseCase<bool, DeleteCategoryParams> {
  final CategoriesRepository repository;
  final ImageStorageService imageStorageService;

  DeleteCategoryUsecase(this.repository, this.imageStorageService);

  @override
  Future<Either<Failure, bool>> call(DeleteCategoryParams params) async {
    if (params.image != null) {
      await imageStorageService.deleteImage(params.image!.path);
    }

    final result = await repository.deleteCategory(params.categoryId);
    return result;
  }
}
