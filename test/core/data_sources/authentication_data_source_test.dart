import 'package:bloc_tutorial/core/data/data_sources/authentication_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../stubs/remote_client_stub.dart';

void main() {
  final RemoteClientStub remoteClient = RemoteClientStub();

  setUp(() {
    remoteClient.hasError = false;
    remoteClient.error = null;
    remoteClient.result = null;
  });

  final sut = AuthenticationDataSourceImpl(remoteClient: remoteClient);

  String dummy = "dummy";

  group("signInWithEmailAndPassword", () {
    test("If everything went fine return void", () async {
      final result = await sut.signInWithEmailAndPassword(dummy, dummy);

      expect(result.hasData, false);
      expect(result.hasError, false);
    });

    test("If something went wrong should return error string", () async {
      remoteClient.result = null;
      remoteClient.error = dummy;
      remoteClient.hasError = true;

      final result = await sut.signInWithEmailAndPassword(dummy, dummy);

      expect(result.hasData, false);
      expect(result.hasError, true);
      expect(result.error, dummy);
    });
  });
}
