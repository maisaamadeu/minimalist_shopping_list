abstract class LocalDatabase {
  Future<void> insert(String table, Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> query(
    String table, {
    String? where,
    List<Object?>? args,
  });
  Future<void> update(
    String table,
    Map<String, dynamic> data, {
    required String where,
    required List<Object?> args,
  });
  Future<void> delete(
    String table, {
    required String where,
    required List<Object?> args,
  });
}
