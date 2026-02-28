import 'package:minimalist_shopping_list/features/auth/domain/params/forgot_password_params.dart';
import 'package:minimalist_shopping_list/features/auth/domain/params/sign_in_params.dart';
import 'package:minimalist_shopping_list/features/auth/domain/params/sign_up_params.dart';

sealed class AuthEvent {}

class SignInRequested extends AuthEvent {
  final SignInParams params;

  SignInRequested(this.params);
}

class SignUpRequested extends AuthEvent {
  final SignUpParams params;

  SignUpRequested(this.params);
}

class ForgotPasswordRequested extends AuthEvent {
  final ForgotPasswordParams params;

  ForgotPasswordRequested(this.params);
}

class SignOutRequested extends AuthEvent {}
