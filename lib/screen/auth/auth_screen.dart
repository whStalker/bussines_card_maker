import 'package:bussines_card_maker/screen/auth/login_screen.dart';
import 'package:bussines_card_maker/screen/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged
          if (snapshot.hasData) {
            return const MainPage();
          }
          // user is NOT logged in
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
