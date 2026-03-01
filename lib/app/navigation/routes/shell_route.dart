import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:minimalist_shopping_list/app/navigation/route_names.dart';
import 'package:minimalist_shopping_list/app/shell/home_shell_page.dart';
import 'package:minimalist_shopping_list/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:minimalist_shopping_list/features/categories/presentation/bloc/categories_event.dart';
import 'package:minimalist_shopping_list/features/categories/presentation/pages/categories_page.dart';

final homeShell = ShellRoute(
  builder: (context, state, child) {
    return HomeShellPage(child: child);
  },
  routes: [
    GoRoute(path: Routes.lists, builder: (_, _) => const SizedBox()),
    GoRoute(path: Routes.products, builder: (_, _) => const SizedBox()),
    GoRoute(
      path: Routes.categories,
      builder: (_, _) => BlocProvider(
        create: (_) {
          final sl = GetIt.instance;

          return CategoriesBloc(sl(), sl(), sl(), sl())
            ..add(LoadCategoriesRequested());
        },
        child: CategoriesPage(),
      ),
    ),
    GoRoute(path: Routes.settings, builder: (_, _) => const SizedBox()),
  ],
);
