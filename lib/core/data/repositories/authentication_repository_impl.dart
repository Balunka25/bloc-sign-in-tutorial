import 'package:bloc_tutorial/app_get_it.dart';
import 'package:bloc_tutorial/core/data/data_sources/authentication_data_source.dart';
import 'package:bloc_tutorial/core/domain/repositories/authentication_repository.dart';
import 'package:bloc_tutorial/core/generics/resource/resource.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSource _ds;

  AuthenticationRepositoryImpl({AuthenticationDataSource? ds})
      : _ds = ds ?? AppGetIt().getIt<AuthenticationDataSource>();

  @override
  Future<Resource<String, void>> signInWithEmailAndPassword(
      String email, String password) async {
    final resource = await _ds.signInWithEmailAndPassword(email, password);

    if (resource.hasError) {
      return Resource(error: resource.error);
    }
    return Resource();
  }
}
