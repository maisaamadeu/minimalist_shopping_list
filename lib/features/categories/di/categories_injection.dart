import 'package:get_it/get_it.dart';
import 'package:minimalist_shopping_list/features/categories/domain/repositories/categories_repository.dart';
import 'package:minimalist_shopping_list/features/categories/domain/usecases/create_category_usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/usecases/delete_category_usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/usecases/get_categories_by_name_usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/usecases/get_category_by_id_usecase.dart';
import 'package:minimalist_shopping_list/features/categories/domain/usecases/update_category_usecase.dart';
import 'package:minimalist_shopping_list/features/categories/external/datasources/local/local_categories_datasource_impl.dart';
import 'package:minimalist_shopping_list/features/categories/infra/datasources/local/local_categories_datasource.dart';
import 'package:minimalist_shopping_list/features/categories/infra/repositories/categories_repository_impl.dart';

void initCategories() {
  final sl = GetIt.instance;

  sl.registerLazySingleton<LocalCategoriesDatasource>(
    () => LocalCategoriesDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => CreateCategoryUsecase(sl(), sl()));
  sl.registerLazySingleton(() => DeleteCategoryUsecase(sl(), sl()));
  sl.registerLazySingleton(() => GetAllCategoriesUsecase(sl()));
  sl.registerLazySingleton(() => GetCategoriesByNameUsecase(sl()));
  sl.registerLazySingleton(() => GetCategoryByIdUsecase(sl()));
  sl.registerLazySingleton(() => UpdateCategoryUsecase(sl(), sl()));
}
