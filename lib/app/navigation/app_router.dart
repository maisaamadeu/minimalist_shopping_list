import 'package:go_router/go_router.dart';
import 'package:minimalist_shopping_list/app/navigation/auth_guard.dart';
import 'package:minimalist_shopping_list/app/navigation/route_names.dart';
import 'package:minimalist_shopping_list/app/navigation/routes/auth_routes.dart';
import 'package:minimalist_shopping_list/app/navigation/routes/shell_route.dart';
import 'package:minimalist_shopping_list/app/navigation/routes/shopping_list_routes.dart';
import 'package:minimalist_shopping_list/app/navigation/routes/splash_route.dart';

final authGuard = AuthGuard(() => true);
final router = GoRouter(
  initialLocation: Routes.splash,
  redirect: (context, state) {
    return authGuard.redirect(state.path);
  },
  routes: [shellRoute(), ...authRoutes, ...shoppingListRoutes, splashRoute],
);
