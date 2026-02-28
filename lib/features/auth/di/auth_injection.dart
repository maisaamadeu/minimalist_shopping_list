import 'package:get_it/get_it.dart';
import 'package:minimalist_shopping_list/features/auth/domain/repositories/auth_repository.dart';
import 'package:minimalist_shopping_list/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:minimalist_shopping_list/features/auth/domain/usecases/has_valid_session_usecase.dart';
import 'package:minimalist_shopping_list/features/auth/domain/usecases/sign_in_with_email_and_password_usecase.dart';
import 'package:minimalist_shopping_list/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:minimalist_shopping_list/features/auth/domain/usecases/sign_up_with_email_and_passoword_usecase.dart';
import 'package:minimalist_shopping_list/features/auth/external/datasources/local/local_auth_datasource_impl.dart';
import 'package:minimalist_shopping_list/features/auth/external/datasources/remote/remote_auth_datasource_impl.dart';
import 'package:minimalist_shopping_list/features/auth/infra/datasources/local/local_auth_datasource.dart';
import 'package:minimalist_shopping_list/features/auth/infra/datasources/remote/remote_auth_datasource.dart';
import 'package:minimalist_shopping_list/features/auth/infra/repositories/auth_repository_impl.dart';

void initAuth() {
  final sl = GetIt.instance;

  sl.registerLazySingleton<LocalAuthDatasource>(
    () => LocalAuthDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<RemoteAuthDatasource>(
    () => RemoteAuthDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton(() => SignInWithEmailAndPasswordUsecase(sl()));
  sl.registerLazySingleton(() => SignUpWithEmailAndPasswordUsecase(sl()));
  sl.registerLazySingleton(() => SignOutUsecase(sl()));
  sl.registerLazySingleton(() => HasValidSessionUsecase(sl()));
  sl.registerLazySingleton(() => ForgotPasswordUsecase(sl()));
}
