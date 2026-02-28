import 'package:get_it/get_it.dart';
import 'package:minimalist_shopping_list/features/splash/domain/usecases/check_session_usecase.dart';

void initSplash() {
  final sl = GetIt.instance;

  sl.registerLazySingleton(() => CheckSessionUsecase(sl()));
}
