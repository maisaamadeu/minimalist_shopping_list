import 'package:minimalist_shopping_list/app/navigation/route_names.dart';

class AuthGuard {
  final bool Function() isLogged;

  AuthGuard(this.isLogged);

  String? redirect(String? route) {
    if (!isLogged() && route != Routes.login) {
      return Routes.login;
    }

    return null;
  }
}
