import 'package:bloc_tutorial/app_get_it.dart';
import 'package:bloc_tutorial/core/domain/entities/user_entity.dart';
import 'package:bloc_tutorial/core/domain/repositories/authentication_repository.dart';
import 'package:bloc_tutorial/core/generics/resource/resource.dart';

abstract class SignInUseCase {
  Future<Resource<String, UserEntity>> call(String email, String password);
}

class SignInUseCaseImpl implements SignInUseCase {
  final AuthenticationRepository _repo = AppGetIt().getIt<AuthenticationRepository>();

  @override
  Future<Resource<String, UserEntity>> call(
      String email, String password) async {
    final resource = await _repo.signInWithEmailAndPassword(email, password);
    if (resource.hasError) {
      return Resource(error: resource.error);
    }
    return Resource();
  }
}
