part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState{}

class AuthLoged extends AuthState{
  final User user;
  AuthLoged(this.user);
}

class AuthError extends AuthState{
  final String message;
  AuthError(this.message);
}

class AuthLogout extends AuthState{}

class AuthUnvalidated extends AuthState{}
