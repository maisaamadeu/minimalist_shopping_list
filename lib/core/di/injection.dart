import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:minimalist_shopping_list/core/cache/database/local_database.dart';
import 'package:minimalist_shopping_list/core/cache/database/sqflite_database.dart';
import 'package:get_it/get_it.dart';
import 'package:minimalist_shopping_list/core/cache/storage/secure_storage.dart';
import 'package:minimalist_shopping_list/core/domain/services/image_storage_service.dart';
import 'package:minimalist_shopping_list/core/infra/services/image_storage_service_impl.dart';
import 'package:minimalist_shopping_list/core/network/dio_http_client.dart';
import 'package:minimalist_shopping_list/core/network/http_client.dart';

Future<void> initCore() async {
  final sl = GetIt.instance;

  final database = await openSqfliteDatabase();

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<HttpClient>(() => DioHttpClient(sl()));

  sl.registerLazySingleton<LocalDatabase>(() => SqfliteDatabase(database));

  sl.registerLazySingleton(() => SecureStorage(const FlutterSecureStorage()));

  sl.registerLazySingleton<ImageStorageService>(
    () => LocalImageStorageServiceImpl(),
  );
}
