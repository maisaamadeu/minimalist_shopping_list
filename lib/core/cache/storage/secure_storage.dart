import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:minimalist_shopping_list/core/error/error.dart';

class SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorage(this._storage);

  Future<void> write(String key, String value) {
    try {
      return _storage.write(key: key, value: value);
    } catch (e) {
      throw StorageException('Write failed: $e');
    }
  }

  Future<String?> read(String key) {
    try {
      return _storage.read(key: key);
    } catch (e) {
      throw StorageException('Read failed: $e');
    }
  }

  Future<void> delete(String key) {
    try {
      return _storage.delete(key: key);
    } catch (e) {
      throw StorageException('Delete failed: $e');
    }
  }

  Future<void> clear() {
    try {
      return _storage.deleteAll();
    } catch (e) {
      throw StorageException('Clear failed: $e');
    }
  }
}
