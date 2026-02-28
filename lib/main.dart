import 'package:flutter/material.dart';
import 'package:minimalist_shopping_list/app/app.dart';
import 'package:minimalist_shopping_list/app/di/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  runApp(const App());
}
