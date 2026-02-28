import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimalist_shopping_list/features/settings/domain/repositories/theme_repository.dart';
import 'package:minimalist_shopping_list/features/settings/presentation/bloc/theme/theme_event.dart';
import 'package:minimalist_shopping_list/features/settings/presentation/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository repository;

  ThemeBloc(this.repository) : super(ThemeLight()) {
    on<LoadTheme>(_onLoad);
    on<ToggleTheme>(_onToggle);
    on<SetLight>(_setLight);
    on<SetDark>(_setDark);
  }

  Future<void> _onLoad(LoadTheme event, Emitter<ThemeState> emit) async {
    final result = await repository.isDark();

    emit(
      result.fold(
        (error) => ThemeLight(),
        (isDark) => isDark ? ThemeDark() : ThemeLight(),
      ),
    );
  }

  Future<void> _onToggle(ToggleTheme event, Emitter<ThemeState> emit) async {
    final isDark = state is ThemeDark;
    final result = await repository.saveDark(!isDark);

    result.fold(
      (error) {},
      (success) => emit(!isDark ? ThemeDark() : ThemeLight()),
    );
  }

  Future<void> _setDark(SetDark event, Emitter<ThemeState> emit) async {
    final result = await repository.saveDark(true);

    result.fold((error) {}, (success) => emit(ThemeDark()));
  }

  Future<void> _setLight(SetLight event, Emitter<ThemeState> emit) async {
    final result = await repository.saveDark(false);

    result.fold((error) {}, (success) => emit(ThemeLight()));
  }
}
