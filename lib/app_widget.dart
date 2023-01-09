import 'package:bloc_tutorial/features/login/controller/cubit/sign_in_cubit.dart';
import 'package:bloc_tutorial/features/login/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => BlocProvider(
              create: (context) => SignInCubit(),
              child: const LoginPage(),
            ),
      },
      useInheritedMediaQuery: true,
    );
  }
}
