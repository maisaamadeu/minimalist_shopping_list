import 'package:dartz/dartz.dart';

import 'package:minimalist_shopping_list/core/error/failures/failures.dart';
import 'package:minimalist_shopping_list/core/usecase/usecase.dart';
import 'package:minimalist_shopping_list/features/auth/domain/entities/session_entity.dart';
import 'package:minimalist_shopping_list/features/auth/domain/params/sign_in_params.dart';
import 'package:minimalist_shopping_list/features/auth/domain/repositories/auth_repository.dart';

class SignInWithEmailAndPasswordUsecase extends UseCase<SessionEntity, SignInParams> {
  final AuthRepository repository;

  SignInWithEmailAndPasswordUsecase(this.repository);

  @override
  Future<Either<Failure, SessionEntity>> call(SignInParams params) async {
    return await repository.signInWithEmailAndPassword(params);
  }
}
