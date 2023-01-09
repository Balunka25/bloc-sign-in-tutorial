import 'package:bloc_tutorial/core/data/data_sources/authentication_data_source.dart';
import 'package:bloc_tutorial/core/data/repositories/authentication_repository_impl.dart';
import 'package:bloc_tutorial/core/domain/repositories/authentication_repository.dart';
import 'package:bloc_tutorial/core/wrappers/remote_client/remote_client.dart';
import 'package:bloc_tutorial/features/login/controller/bloc/sign_in_bloc.dart';
import 'package:bloc_tutorial/features/login/controller/cubit/sign_in_cubit.dart';
import 'package:bloc_tutorial/features/login/domain/use_cases/sign_in_use_case.dart';
import 'package:get_it/get_it.dart';

class AppGetIt {
  final getIt = GetIt.instance;
  AppGetIt();

  Future<void> setup() async {
    getIt.registerFactory<RemoteClient>(() => RemoteClientImpl());
    /*****************************/ /*DATA SOURCE*/ /*****************************/
    getIt.registerFactory<AuthenticationDataSource>(
        () => AuthenticationDataSourceImpl());
    /*****************************/
    /*****************************/ /*REPOSITORIES*/ /*****************************/
    getIt.registerFactory<AuthenticationRepository>(() => AuthenticationRepositoryImpl());
    /*****************************/
    /*****************************/ /*USE CASES*/ /*****************************/
    getIt.registerFactory<SignInUseCase>(() => SignInUseCaseImpl());
    /*****************************/
    /*****************************/ /*BLOCS*/ /*****************************/
    getIt.registerFactory<SignInBloc>(() => SignInBloc());
    getIt.registerFactory<SignInCubit>(() => SignInCubit());
    /*****************************/
  }
}
