import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimalist_shopping_list/core/usecase/usecase.dart';
import 'package:minimalist_shopping_list/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:minimalist_shopping_list/features/auth/domain/usecases/sign_in_with_email_and_password_usecase.dart';
import 'package:minimalist_shopping_list/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:minimalist_shopping_list/features/auth/domain/usecases/sign_up_with_email_and_passoword_usecase.dart';
import 'package:minimalist_shopping_list/features/auth/presentation/bloc/auth_event.dart';
import 'package:minimalist_shopping_list/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmailAndPasswordUsecase _signInWithEmailAndPasswordUsecase;
  final SignUpWithEmailAndPasswordUsecase _signUpWithEmailAndPasswordUsecase;
  final SignOutUsecase _signOutUsecase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;

  AuthBloc(
    this._signInWithEmailAndPasswordUsecase,
    this._signUpWithEmailAndPasswordUsecase,
    this._signOutUsecase,
    this._forgotPasswordUsecase,
  ) : super(AuthInitial()) {
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _signInWithEmailAndPasswordUsecase(event.params);

    result.fold(
      (failure) => emit(AuthError(failure.toString())),
      (success) => emit(AuthAuthenticated()),
    );
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _signUpWithEmailAndPasswordUsecase(event.params);

    result.fold(
      (failure) => emit(AuthError(failure.toString())),
      (success) => emit(AuthAuthenticated()),
    );
  }

  Future<void> _onForgotPasswordRequested(
    ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _forgotPasswordUsecase(event.params);

    result.fold(
      (failure) => emit(AuthError(failure.toString())),
      (success) => emit(AuthActionSuccess()),
    );
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _signOutUsecase(NoParams());

    result.fold(
      (failure) => emit(AuthError(failure.toString())),
      (success) => emit(AuthUnauthenticated()),
    );
  }
}
