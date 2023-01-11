import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/app_get_it.dart';
import 'package:bloc_tutorial/features/login/domain/use_cases/sign_in_use_case.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase _signInUseCase;

  SignInBloc({SignInUseCase? signInUseCase})
      : _signInUseCase = signInUseCase ?? AppGetIt().getIt<SignInUseCase>(),
        super(const SignInState.initial()) {
    on<OnSignIn>(onSignIn);
    on<OnPassChanged>(onPassChanged);
    on<OnEmailChanged>(onEmailChanged);
  }

  onPassChanged(OnPassChanged event, emit) =>
      emit(state.copyWith(password: event.password));

  onEmailChanged(OnEmailChanged event, emit) =>
      emit(state.copyWith(email: event.email));

  onSignIn(OnSignIn event, emit) async {
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
