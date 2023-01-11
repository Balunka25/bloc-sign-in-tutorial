import 'package:bloc_tutorial/app_get_it.dart';
import 'package:bloc_tutorial/core/generics/resource/resource.dart';
import 'package:bloc_tutorial/core/wrappers/remote_client/remote_client.dart';

abstract class AuthenticationDataSource {
  Future<Resource<String, void>> signInWithEmailAndPassword(
      String email, String password);
}

class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  final RemoteClient _remoteClient;

  AuthenticationDataSourceImpl({RemoteClient? remoteClient})
      : _remoteClient = remoteClient ?? AppGetIt().getIt<RemoteClient>();

  @override
  Future<Resource<String, void>> signInWithEmailAndPassword(
      String email, String password) async {
    final resource =
        await _remoteClient.signInWithEmailAndPassword(email, password);

    if (resource.hasError) {
      return Resource(error: resource.error);
    }

    return Resource();
  }
}
