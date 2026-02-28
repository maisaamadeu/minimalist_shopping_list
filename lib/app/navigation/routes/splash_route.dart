import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:minimalist_shopping_list/app/navigation/route_names.dart';
import 'package:minimalist_shopping_list/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:minimalist_shopping_list/features/splash/presentation/bloc/splash_event.dart';
import 'package:minimalist_shopping_list/features/splash/presentation/pages/splash_page.dart';

final splashRoute = GoRoute(
  path: Routes.splash,
  builder: (_, _) {
    final sl = GetIt.instance;

    return BlocProvider(
      create: (_) => SplashBloc(sl())..add(SplashStarted()),
      child: const SplashPage(),
    );
  },
);
