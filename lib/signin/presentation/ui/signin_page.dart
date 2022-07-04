import 'package:bluebenx/core/constants/colors.dart';
import 'package:bluebenx/core/routes/named_routes.dart';
import 'package:bluebenx/signin/presentation/store/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _authenticateWithEmailAndPassword(
    BuildContext context,
    AuthState state,
  ) {
    if (_formKey.currentState!.validate()) {
      var response = context.read<AuthBloc>();
      response.add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (context) => GetIt.I.get<AuthBloc>(),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is Authenticated) {
              Navigator.pushReplacementNamed(context, NamedRoutes.homeRoute);
            }
            if (state is AuthError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
            return LayoutBuilder(
              builder: (context, constraints) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxHeight: constraints.maxHeight * 0.25,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xff2b0d73),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(60, 35),
                                bottomRight: Radius.elliptical(60, 35),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  'Seja bem vindo!',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 48,
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  cursorColor: CustomColors.purple,
                                  decoration: const InputDecoration(
                                    hintText: 'Inserir email',
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  cursorColor: CustomColors.purple,
                                  decoration: const InputDecoration(
                                    hintText: 'Inserir senha',
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _authenticateWithEmailAndPassword(
                                        context, state);
                                  },
                                  child: const Text(
                                    'Logar',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
