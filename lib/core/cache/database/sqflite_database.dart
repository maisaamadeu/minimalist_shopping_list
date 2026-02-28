import 'package:minimalist_shopping_list/core/cache/database/local_database.dart';
import 'package:minimalist_shopping_list/core/error/error.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> openSqfliteDatabase() async {
  final databasePath = await getDatabasesPath();
  final path = '$databasePath/app.db';

  return openDatabase(path, version: 1, onCreate: (db, version) async {});
}

class SqfliteDatabase implements LocalDatabase {
  final Database db;

  SqfliteDatabase(this.db);

  @override
  Future<void> insert(String table, Map<String, dynamic> data) {
    try {
      return db.insert(table, data);
    } catch (e) {
      throw CacheException('Insertion failed: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> query(String table) {
    try {
      return db.query(table);
    } catch (e) {
      throw CacheException('Query failed: $e');
    }
  }

  @override
  Future<void> update(String table, Map<String, dynamic> data, String where, List<Object?> args) {
    try {
      return db.update(table, data, where: where, whereArgs: args);
    } catch (e) {
      throw CacheException('Update failed: $e');
    }
  }

  @override
  Future<void> delete(String table, String where, List<Object?> args) {
    try {
      return db.delete(table, where: where, whereArgs: args);
    } catch (e) {
      throw CacheException('Deletion failed: $e');
    }
  }
}
