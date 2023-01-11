part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class OnSignIn extends SignInEvent {
  const OnSignIn();

  @override
  List<Object?> get props => [];
}

class OnPassChanged extends SignInEvent {
  final String password;

  const OnPassChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

class OnEmailChanged extends SignInEvent {
  final String email;

  const OnEmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

