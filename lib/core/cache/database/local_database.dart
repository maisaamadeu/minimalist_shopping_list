abstract class LocalDatabase {
  Future<void> insert(String table, Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> query(String table);
  Future<void> update(String table, Map<String, dynamic> data, String where, List<Object?> args);
  Future<void> delete(String table, String where, List<Object?> args);
}
