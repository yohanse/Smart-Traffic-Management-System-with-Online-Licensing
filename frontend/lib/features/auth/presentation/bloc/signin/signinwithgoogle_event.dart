part of 'signinwithgoogle_bloc.dart';

sealed class SigninwithgoogleEvent extends Equatable {
  const SigninwithgoogleEvent();

  @override
  List<Object> get props => [];
}

final class SignInWithGoogleStarted extends SigninwithgoogleEvent {}