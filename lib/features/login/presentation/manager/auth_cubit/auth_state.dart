part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}


class AuthLoading extends AuthState {}
class AuthSelectUpdated extends AuthState {}

class AuthSuccess extends AuthState {
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure({required this.error});
}
