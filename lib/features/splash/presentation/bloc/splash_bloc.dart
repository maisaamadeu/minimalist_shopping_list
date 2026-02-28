import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimalist_shopping_list/core/usecase/usecase.dart';
import 'package:minimalist_shopping_list/features/splash/domain/usecases/check_session_usecase.dart';
import 'package:minimalist_shopping_list/features/splash/presentation/bloc/splash_event.dart';
import 'package:minimalist_shopping_list/features/splash/presentation/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._checkSession) : super(SplashInitial()) {
    on<SplashStarted>(_onStarted);
  }

  final CheckSessionUsecase _checkSession;

  Future<void> _onStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoading());

    final hasSession = await _checkSession(NoParams());

    hasSession.fold(
      (failure) => emit(SplashGoLogin()),
      (hasSession) => emit(hasSession ? SplashGoHome() : SplashGoLogin()),
    );
  }
}
