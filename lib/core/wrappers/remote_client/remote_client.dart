import 'package:bloc_tutorial/core/generics/resource/resource.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteClient {
  Future<Resource<dynamic, dynamic>> signInWithEmailAndPassword(
      String email, String password);
}

class RemoteClientImpl extends RemoteClient {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Resource<dynamic, dynamic>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return Resource();
    } on FirebaseAuthException catch (e) {
      return Resource(error: e.code);
    }
  }
}
