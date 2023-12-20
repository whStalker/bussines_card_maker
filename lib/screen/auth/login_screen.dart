import 'package:bussines_card_maker/bloc/app_cubit.dart';
import 'package:bussines_card_maker/screen/auth/register_screen.dart';
import 'package:bussines_card_maker/screen/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text contollers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, AppState>(listener: (context, state) {
        if (state is UserLogIn) {
          Navigator.of(context).pushReplacementNamed(MainPage.id);
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo

              // email textfield
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),

              const SizedBox(height: 20),

              // passsword textfield
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
                // obscureText: true,
              ),

              const SizedBox(height: 20),

              // forgot password
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Забыли пароль?"),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // sign in button
              GestureDetector(
                onTap: () {
                  context.read<AppCubit>().logIn(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Войти',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // continue with google
              const Text('Google'),

              // not member? register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Нет аккаунта?'),
                  const SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RegisterPage.id);
                    },
                    child: const Text(
                      'Создайте аккаунт',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
