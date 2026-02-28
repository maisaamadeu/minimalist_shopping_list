import 'package:dartz/dartz.dart';

import 'package:minimalist_shopping_list/core/error/failures/failures.dart';
import 'package:minimalist_shopping_list/core/usecase/usecase.dart';
import 'package:minimalist_shopping_list/features/auth/domain/params/forgot_password_params.dart';
import 'package:minimalist_shopping_list/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUsecase extends UseCase<bool, ForgotPasswordParams> {
  final AuthRepository repository;

  ForgotPasswordUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(ForgotPasswordParams params) async {
    return await repository.forgotPassword(params);
  }
}
