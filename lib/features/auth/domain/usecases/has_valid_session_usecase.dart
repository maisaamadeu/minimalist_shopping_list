import 'package:dartz/dartz.dart';

import 'package:minimalist_shopping_list/core/error/failures/failures.dart';
import 'package:minimalist_shopping_list/core/usecase/usecase.dart';
import 'package:minimalist_shopping_list/features/auth/domain/repositories/auth_repository.dart';

class HasValidSessionUsecase extends UseCase<bool, NoParams> {
  final AuthRepository repository;

  HasValidSessionUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.hasValidSession();
  }
}
