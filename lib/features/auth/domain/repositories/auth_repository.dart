import 'package:dartz/dartz.dart';
import 'package:minimalist_shopping_list/core/error/failures/failures.dart';
import 'package:minimalist_shopping_list/features/auth/domain/entities/session_entity.dart';
import 'package:minimalist_shopping_list/features/auth/domain/params/sign_in_params.dart';
import 'package:minimalist_shopping_list/features/auth/domain/params/sign_up_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, SessionEntity>> signInWithEmailAndPassword(SignInParams params);
  Future<Either<Failure, SessionEntity>> signUpWithEmailAndPassword(SignUpParams params);
  Future<Either<Failure, bool>> signOut();
  Future<Either<Failure, bool>> hasValidSession();
}
