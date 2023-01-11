import 'package:bloc_tutorial/features/home/view/home_page.dart';
import 'package:bloc_tutorial/features/login/controller/cubit/sign_in_cubit.dart';
import 'package:bloc_tutorial/features/widgets/dialogs/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocConsumer<SignInCubit, SignInState>(
            listenWhen: (oldS, newS) =>
                oldS.success != newS.success || oldS.error != newS.error,
            listener: (context, state) {
              if (state.success) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }

              if (state.error.isNotEmpty) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return ErrorDialog(text: state.error);
                    });
              }
            },
            buildWhen: (oldState, newState) =>
                oldState.isLoading != newState.isLoading,
            builder: (context, state) {
              return Scaffold(
                  body: SafeArea(
                      child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Column(
                      children: [
                        TextFormField(
                          initialValue: "isabella@teste.com",
                          onChanged: (value) =>
                              BlocProvider.of<SignInCubit>(context)
                                  .onEmailChanged(value),
                          decoration: const InputDecoration(hintText: "Email"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue: "teste123",
                          onChanged: (value) =>
                              BlocProvider.of<SignInCubit>(context)
                                  .onPassChanged(value),
                          decoration: const InputDecoration(hintText: "Senha"),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<SignInCubit>(context).onSignIn();
                            },
                            child: Text(
                                state.isLoading ? "Carregando..." : "Sign in"))
                      ],
                    )
                  ],
                ),
              )));
            }));
  }
}
