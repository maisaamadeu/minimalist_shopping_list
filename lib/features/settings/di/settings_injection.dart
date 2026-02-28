import 'package:get_it/get_it.dart';
import 'package:minimalist_shopping_list/features/settings/domain/repositories/theme_repository.dart';
import 'package:minimalist_shopping_list/features/settings/external/datasources/local/local_theme_datasource_impl.dart';
import 'package:minimalist_shopping_list/features/settings/infra/datasources/local/local_theme_datasource.dart';
import 'package:minimalist_shopping_list/features/settings/infra/repositories/theme_repository_impl.dart';

void initSettings() {
  final sl = GetIt.instance;

  sl.registerLazySingleton<LocalThemeDatasource>(
    () => LocalThemeDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl(sl()));
}
