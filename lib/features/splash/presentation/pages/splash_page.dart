import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:minimalist_shopping_list/app/navigation/route_names.dart';
import 'package:minimalist_shopping_list/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:minimalist_shopping_list/features/splash/presentation/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashGoHome) {
          context.go(Routes.lists);
        }

        if (state is SplashGoLogin) {
          context.go(Routes.login);
        }
      },
      child: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
