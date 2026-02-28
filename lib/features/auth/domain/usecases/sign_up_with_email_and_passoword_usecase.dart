import 'package:dartz/dartz.dart';

import 'package:minimalist_shopping_list/core/error/failures/failures.dart';
import 'package:minimalist_shopping_list/core/usecase/usecase.dart';
import 'package:minimalist_shopping_list/features/auth/domain/entities/session_entity.dart';
import 'package:minimalist_shopping_list/features/auth/domain/params/sign_up_params.dart';
import 'package:minimalist_shopping_list/features/auth/domain/repositories/auth_repository.dart';

class SignUpWithEmailAndPasswordUsecase extends UseCase<SessionEntity, SignUpParams> {
  final AuthRepository repository;

  SignUpWithEmailAndPasswordUsecase(this.repository);

  @override
  Future<Either<Failure, SessionEntity>> call(SignUpParams params) async {
    return await repository.signUpWithEmailAndPassword(params);
  }
}
