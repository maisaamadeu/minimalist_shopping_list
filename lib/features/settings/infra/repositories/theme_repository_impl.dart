import 'package:dartz/dartz.dart';
import 'package:minimalist_shopping_list/core/error/failures/failures.dart';
import 'package:minimalist_shopping_list/core/error/map_exception.dart';
import 'package:minimalist_shopping_list/features/settings/domain/repositories/theme_repository.dart';
import 'package:minimalist_shopping_list/features/settings/infra/datasources/local/local_theme_datasource.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final LocalThemeDatasource localThemeDatasource;

  ThemeRepositoryImpl(this.localThemeDatasource);

  @override
  Future<Either<Failure, bool>> isDark() async {
    try {
      final result = await localThemeDatasource.isDark();
      return Right(result);
    } catch (e) {
      return Left(mapException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> saveDark(bool value) async {
    try {
      await localThemeDatasource.saveDark(value);
      return Right(true);
    } catch (e) {
      return Left(mapException(e));
    }
  }
}
