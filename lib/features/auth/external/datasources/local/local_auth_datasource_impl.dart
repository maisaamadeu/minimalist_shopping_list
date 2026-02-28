import 'dart:convert';

import 'package:minimalist_shopping_list/core/cache/storage/secure_storage.dart';
import 'package:minimalist_shopping_list/core/cache/storage/storage_keys.dart';
import 'package:minimalist_shopping_list/features/auth/infra/datasources/local/local_auth_datasource.dart';
import 'package:minimalist_shopping_list/features/auth/infra/models/session_model.dart';

class LocalAuthDatasourceImpl implements LocalAuthDatasource {
  final SecureStorage storage;

  LocalAuthDatasourceImpl(this.storage);

  @override
  Future<void> deleteSession() async {
    await storage.delete(StorageKeys.session);
  }

  @override
  Future<SessionModel?> getSession() async {
    return await storage.read(StorageKeys.session).then((sessionData) {
      if (sessionData != null) {
        return SessionModel.fromJson(jsonDecode(sessionData));
      }
      return null;
    });
  }

  @override
  Future<void> saveSession(SessionModel session) async {
    await storage.write(StorageKeys.session, jsonEncode(session.toJson()));
  }

  @override
  Future<void> updateSession(SessionModel session) async {
    await storage.write(StorageKeys.session, jsonEncode(session.toJson()));
  }
}
