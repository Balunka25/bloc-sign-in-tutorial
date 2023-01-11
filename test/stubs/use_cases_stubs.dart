import 'package:bloc_tutorial/core/generics/resource/resource.dart';
import 'package:bloc_tutorial/core/domain/entities/user_entity.dart';
import 'package:bloc_tutorial/features/login/domain/use_cases/sign_in_use_case.dart';

class SignInUseCaseStub extends SignInUseCase {
  bool hasError = false;
  String? error;
  dynamic result;

  @override
  Future<Resource<String, UserEntity>> call(
      String email, String password) async {
    return hasError ? Resource(error: error) : Resource();
  }
}
