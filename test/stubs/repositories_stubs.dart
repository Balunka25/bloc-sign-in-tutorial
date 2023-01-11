import 'package:bloc_tutorial/core/domain/repositories/authentication_repository.dart';
import 'package:bloc_tutorial/core/generics/resource/resource.dart';

class AuthenticationRepositoryStub extends AuthenticationRepository {
  bool hasError = false;
  String? error;
  dynamic result;

  @override
  Future<Resource<String, void>> signInWithEmailAndPassword(
      String email, String password) async {
    return hasError ? Resource(error: error) : Resource();
  }
}
