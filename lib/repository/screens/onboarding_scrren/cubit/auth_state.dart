// auth_state.dart
part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class OTPSent extends AuthState {}

class AuthLoggedIn extends AuthState {
  final User user;
  AuthLoggedIn({required this.user});
}

class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}
