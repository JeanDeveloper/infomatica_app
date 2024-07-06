part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class DoLoginEvent extends AuthEvent{
  final String username;
  final String password;
  DoLoginEvent(this.username, this.password);
}

class DoLogoutEvent extends AuthEvent{}
class StartValidation extends AuthEvent{}

// class GetUserStorageEvent extends AuthEvent{}