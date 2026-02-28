import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:minimalist_shopping_list/app/navigation/route_names.dart';
import 'package:minimalist_shopping_list/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:minimalist_shopping_list/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:minimalist_shopping_list/features/auth/presentation/pages/sign_in_page.dart';
import 'package:minimalist_shopping_list/features/auth/presentation/pages/sign_up_page.dart';

final authShell = ShellRoute(
  builder: (context, state, child) {
    final sl = GetIt.instance;

    return BlocProvider(
      create: (_) => AuthBloc(sl(), sl(), sl(), sl()),
      child: child,
    );
  },
  routes: [
    GoRoute(path: Routes.login, builder: (_, __) => SignInPage()),
    GoRoute(path: Routes.register, builder: (_, __) => SignUpPage()),
    GoRoute(
      path: Routes.forgotPassword,
      builder: (_, __) => ForgotPasswordPage(),
    ),
  ],
);
