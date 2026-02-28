import 'package:dartz/dartz.dart';
import 'package:minimalist_shopping_list/core/error/failures/failures.dart';

abstract class ThemeRepository {
  Future<Either<Failure, bool>> isDark();
  Future<Either<Failure, bool>> saveDark(bool value);
}
