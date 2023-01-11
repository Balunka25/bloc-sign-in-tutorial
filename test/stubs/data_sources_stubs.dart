import 'package:bloc_tutorial/core/data/data_sources/authentication_data_source.dart';
import 'package:bloc_tutorial/core/generics/resource/resource.dart';

class AuthenticationDataSourceStub extends AuthenticationDataSource {
  bool hasError = false;
  String? error;
  dynamic result;

  @override
  Future<Resource<String, void>> signInWithEmailAndPassword(
      String email, String password) async {
    return hasError ? Resource(error: error) : Resource();
  }
}
