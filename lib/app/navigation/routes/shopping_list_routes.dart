import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minimalist_shopping_list/app/navigation/route_names.dart';

final shoppingListRoutes = [listDetailRoute];

final listDetailRoute = GoRoute(
  path: Routes.listDetail,
  builder: (context, state) {
    // final id = state.pathParameters['id']!;
    return const SizedBox();
  },
);
