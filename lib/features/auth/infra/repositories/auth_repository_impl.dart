import 'package:dartz/dartz.dart';
import 'package:minimalist_shopping_list/core/error/error.dart';
import 'package:minimalist_shopping_list/features/auth/domain/entities/session_entity.dart';
import 'package:minimalist_shopping_list/features/auth/domain/params/sign_in_params.dart';
import 'package:minimalist_shopping_list/features/auth/domain/params/sign_up_params.dart';
import 'package:minimalist_shopping_list/features/auth/domain/repositories/auth_repository.dart';
import 'package:minimalist_shopping_list/features/auth/infra/datasources/local/local_auth_datasource.dart';
import 'package:minimalist_shopping_list/features/auth/infra/datasources/remote/remote_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalAuthDatasource localAuthDatasource;
  final RemoteAuthDatasource remoteAuthDatasource;

  AuthRepositoryImpl(this.localAuthDatasource, this.remoteAuthDatasource);

  @override
  Future<Either<Failure, bool>> hasValidSession() async {
    try {
      final result = await localAuthDatasource.getSession();
      return Right(result != null);
    } catch (e) {
      return Left(mapException(e));
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> signInWithEmailAndPassword(
    SignInParams params,
  ) async {
    try {
      final result = await remoteAuthDatasource.signInWithEmailAndPassword(
        params.email,
        params.password,
      );

      await localAuthDatasource.saveSession(result);

      return Right(result);
    } catch (e) {
      return Left(mapException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await remoteAuthDatasource.signOut();
      await localAuthDatasource.deleteSession();
      return Right(true);
    } catch (e) {
      return Left(mapException(e));
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> signUpWithEmailAndPassword(
    SignUpParams params,
  ) async {
    try {
      final result = await remoteAuthDatasource.signUpWithEmaildAndPassword(
        params.name,
        params.email,
        params.password,
      );

      await localAuthDatasource.saveSession(result);

      return Right(result);
    } catch (e) {
      return Left(mapException(e));
    }
  }
}
