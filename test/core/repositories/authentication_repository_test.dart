import 'package:bloc_tutorial/core/data/repositories/authentication_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../stubs/data_sources_stubs.dart';

void main() {
  final AuthenticationDataSourceStub authDs = AuthenticationDataSourceStub();

  setUp(() {
    authDs.hasError = false;
    authDs.error = null;
    authDs.result = null;
  });

  final sut = AuthenticationRepositoryImpl(ds: authDs);

  String dummy = "dummy";

  group("signInWithEmailAndPassword", () {
    test("If everything went fine return void", () async {
      final result = await sut.signInWithEmailAndPassword(dummy, dummy);

      expect(result.hasData, false);
      expect(result.hasError, false);
    });

    test("If something went wrong should return error string", () async {
      authDs.result = null;
      authDs.error = dummy;
      authDs.hasError = true;

      final result = await sut.signInWithEmailAndPassword(dummy, dummy);

      expect(result.hasData, false);
      expect(result.hasError, true);
      expect(result.error, dummy);
    });
  });
}
