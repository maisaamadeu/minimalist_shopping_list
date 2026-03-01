import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:dartz/dartz.dart';
import 'package:minimalist_shopping_list/core/domain/services/image_storage_service.dart';

import 'package:minimalist_shopping_list/core/error/failures/failures.dart';
import 'package:minimalist_shopping_list/core/usecase/usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/entities/category_entity.dart';
import 'package:minimalist_shopping_list/features/categories/domain/params/update_category_params.dart';
import 'package:minimalist_shopping_list/features/categories/domain/repositories/categories_repository.dart';

class UpdateCategoryUsecase
    extends UseCase<CategoryEntity, UpdateCategoryParams> {
  final CategoriesRepository repository;
  final ImageStorageService imageStorageService;

  UpdateCategoryUsecase(this.repository, this.imageStorageService);

  @override
  Future<Either<Failure, CategoryEntity>> call(
    UpdateCategoryParams params,
  ) async {
    if (params.image != null) {
      try {
        final savedImagePath = await imageStorageService.saveImage(
          fileName: '${params.id}.${p.extension(params.image!.path)}',
          file: params.image!,
        );
        params = UpdateCategoryParams(
          id: params.id,
          name: params.name,
          image: File(savedImagePath),
        );
      } catch (e) {
        return Left(ImageStorageFailure(message: 'Failed to save image: $e'));
      }
    }

    return await repository.updateCategory(params);
  }
}
