import 'package:go_router/go_router.dart';
import 'package:minimalist_shopping_list/app/navigation/route_names.dart';
import 'package:minimalist_shopping_list/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:minimalist_shopping_list/features/auth/presentation/pages/sign_in_page.dart';
import 'package:minimalist_shopping_list/features/auth/presentation/pages/sign_up_page.dart';

final authRoutes = [signInRoute, signUpRoute, forgotPasswordRoute];

final signInRoute = GoRoute(
  path: Routes.login,
  builder: (_, __) => SignInPage(),
);

final signUpRoute = GoRoute(
  path: Routes.register,
  builder: (_, __) => SignUpPage(),
);

final forgotPasswordRoute = GoRoute(
  path: Routes.forgotPassword,
  builder: (_, __) => ForgotPasswordPage(),
);
