part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final bool isLoading;
  final bool success;
  final String error;
  final String email;
  final String password;

  const SignInState(
      {required this.isLoading,
      required this.success,
      required this.error,
      required this.email,
      required this.password});

  const SignInState.initial()
      : email = "",
        password = "",
        error = "",
        isLoading = false,
        success = false;

  copyWith({
    bool? isLoading,
    String? email,
    String? password,
    String? error,
    bool? success,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
      success: success ?? this.success,
    );
  }

  @override
  List<Object> get props => [isLoading, success, error, email, password];
}
