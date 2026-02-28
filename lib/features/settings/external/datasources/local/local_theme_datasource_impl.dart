import 'package:minimalist_shopping_list/core/cache/storage/secure_storage.dart';
import 'package:minimalist_shopping_list/core/cache/storage/storage_keys.dart';
import 'package:minimalist_shopping_list/features/settings/infra/datasources/local/local_theme_datasource.dart';

class LocalThemeDatasourceImpl implements LocalThemeDatasource {
  final SecureStorage storage;

  LocalThemeDatasourceImpl(this.storage);

  @override
  Future<bool> isDark() async {
    return bool.tryParse(
          await storage.read(StorageKeys.isDarkTheme) ?? 'false',
        ) ??
        false;
  }

  @override
  Future<void> saveDark(bool value) async {
    await storage.write(StorageKeys.isDarkTheme, value.toString());
  }
}
