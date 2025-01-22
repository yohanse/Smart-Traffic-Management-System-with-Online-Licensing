part of 'signinwithgoogle_bloc.dart';

sealed class SigninwithgoogleState extends Equatable {
  const SigninwithgoogleState();
  
  @override
  List<Object> get props => [];
}

final class SigninwithgoogleInitial extends SigninwithgoogleState {}

final class SigninwithgoogleLoading extends SigninwithgoogleState {}

final class SigninwithgoogleSuccess extends SigninwithgoogleState {
  final bool success;

  const SigninwithgoogleSuccess({required this.success});

  @override
  List<Object> get props => [success];
}

final class SigninwithgoogleFailure extends SigninwithgoogleState {
  final String message;

  const SigninwithgoogleFailure({required this.message});

  @override
  List<Object> get props => [message];
}
 
