import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minimalist_shopping_list/app/navigation/route_names.dart';
import 'package:minimalist_shopping_list/app/shell/home_shell_page.dart';

final homeShell = ShellRoute(
  builder: (context, state, child) {
    return HomeShellPage(child: child);
  },
  routes: [
    GoRoute(path: Routes.lists, builder: (_, _) => const SizedBox()),
    GoRoute(path: Routes.products, builder: (_, _) => const SizedBox()),
    GoRoute(path: Routes.categories, builder: (_, _) => const SizedBox()),
    GoRoute(path: Routes.settings, builder: (_, _) => const SizedBox()),
  ],
);
