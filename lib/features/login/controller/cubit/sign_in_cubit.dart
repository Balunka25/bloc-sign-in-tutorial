import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/app_get_it.dart';
import 'package:bloc_tutorial/features/login/domain/use_cases/sign_in_use_case.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase = AppGetIt().getIt<SignInUseCase>();
  SignInCubit() : super(const SignInState.initial());

  onPassChanged(String value) => emit(state.copyWith(password: value));

  onEmailChanged(String value) => emit(state.copyWith(email: value));

  signIn() async {
    emit(state.copyWith(isLoading: true));

    final resource = await _signInUseCase.call(state.email, state.password);

    if (resource.hasError) {
      emit(state.copyWith(error: resource.error));
    } else {
      emit(state.copyWith(success: true));
    }
    emit(state.copyWith(isLoading: false));
  }
}
