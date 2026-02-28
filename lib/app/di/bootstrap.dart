import 'package:minimalist_shopping_list/core/di/injection.dart';
import 'package:minimalist_shopping_list/features/auth/di/auth_injection.dart';
import 'package:minimalist_shopping_list/features/settings/di/settings_injection.dart';
import 'package:minimalist_shopping_list/features/splash/di/splash_injection.dart';

Future<void> setupDependencies() async {
  await initCore();
  initSettings();
  initAuth();
  initSplash();
}
