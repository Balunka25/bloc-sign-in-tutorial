import 'package:bloc_tutorial/core/generics/resource/resource.dart';

abstract class AuthenticationRepository {
  Future<Resource<String, void>> signInWithEmailAndPassword(
      String email, String password);
}
