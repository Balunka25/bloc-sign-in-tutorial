import 'package:bloc_tutorial/features/login/domain/use_cases/sign_in_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../stubs/repositories_stubs.dart';

void main() {
  final AuthenticationRepositoryStub authRepo = AuthenticationRepositoryStub();

  setUp(() {
    authRepo.hasError = false;
    authRepo.error = null;
    authRepo.result = null;
  });

  final sut = SignInUseCaseImpl(repo: authRepo);

  String dummy = "dummy";

  group("Sign In", () {
    test("If everything went fine return void", () async {
      final result = await sut.call(dummy, dummy);

      expect(result.hasData, false);
      expect(result.hasError, false);
    });

    test("If something went wrong should return error string", () async {
      authRepo.result = null;
      authRepo.error = dummy;
      authRepo.hasError = true;

      final result = await sut.call(dummy, dummy);

      expect(result.hasData, false);
      expect(result.hasError, true);
      expect(result.error, dummy);
    });
  });
}
