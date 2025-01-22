part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginStarted extends LoginEvent {
  final String email, password;

  const LoginStarted({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}