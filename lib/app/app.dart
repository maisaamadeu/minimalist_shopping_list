import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:minimalist_shopping_list/core/design_system/theme/dark_theme.dart';
import 'package:minimalist_shopping_list/core/design_system/theme/light_theme.dart';
import 'package:minimalist_shopping_list/features/settings/presentation/bloc/theme/theme_bloc.dart';
import 'package:minimalist_shopping_list/features/settings/presentation/bloc/theme/theme_event.dart';
import 'package:minimalist_shopping_list/features/settings/presentation/bloc/theme/theme_state.dart';
import 'navigation/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final sl = GetIt.instance;

        return ThemeBloc(sl())..add(LoadTheme());
      },
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final isDark = state is ThemeDark;

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
