import 'package:bloc_tutorial/core/generics/resource/resource.dart';
import 'package:bloc_tutorial/core/wrappers/remote_client/remote_client.dart';

class RemoteClientStub extends RemoteClient {
  bool hasError = false;
  String? error;
  dynamic result;

  @override
  Future<Resource> signInWithEmailAndPassword(
      String email, String password) async {
    return hasError ? Resource(error: error) : Resource(data: result);
  }
}
