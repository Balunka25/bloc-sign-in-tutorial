import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_tutorial/features/login/controller/bloc/sign_in_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../stubs/use_cases_stubs.dart';

void main() {
  final SignInUseCaseStub signInUseCaseStub = SignInUseCaseStub();

  setUp(() {
    signInUseCaseStub.hasError = false;
    signInUseCaseStub.error = null;
    signInUseCaseStub.result = null;
  });

  var sut = SignInBloc(
    signInUseCase: signInUseCaseStub,
  );
  var state = sut.state;

  String dummy = "dummy";

  group("onSignIn", () {
    blocTest("if went fine emit success and stop loading",
        setUp: () {
          sut = SignInBloc(
            signInUseCase: signInUseCaseStub,
          );
          state = sut.state;
        },
        build: () => sut,
        act: (bloc) => bloc.add(const OnSignIn()),
        expect: () => [
              state.copyWith(isLoading: true),
              state.copyWith(success: true, isLoading: true),
              state.copyWith(isLoading: false, success: true),
            ]);

    blocTest("if went bad emit error and stop loading",
        setUp: () {
          signInUseCaseStub.hasError = true;
          signInUseCaseStub.error = dummy;
          sut = SignInBloc(
            signInUseCase: signInUseCaseStub,
          );
          state = sut.state;
        },
        build: () => sut,
        act: (bloc) => bloc.add(const OnSignIn()),
        expect: () => [
              state.copyWith(isLoading: true),
              state.copyWith(error: dummy, isLoading: true),
              state.copyWith(error: dummy, isLoading: false),
            ]);
  });
}
