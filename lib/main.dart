import 'package:bussines_card_maker/bloc/app_cubit.dart';
import 'package:bussines_card_maker/firebase_options.dart';
import 'package:bussines_card_maker/screen/auth/auth_screen.dart';
import 'package:bussines_card_maker/screen/auth/login_screen.dart';
import 'package:bussines_card_maker/screen/auth/register_screen.dart';
import 'package:bussines_card_maker/screen/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: MaterialApp(
        title: 'Visit card',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark(),
        home: const AuthPage(),
        routes: {
          RegisterPage.id: (context) => const RegisterPage(),
          LoginPage.id: (context) => const LoginPage(),
          MainPage.id: (context) => const MainPage(),
        },
      ),
    );
  }
}
