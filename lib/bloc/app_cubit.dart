import 'package:bloc/bloc.dart';
import 'package:bussines_card_maker/models/temp_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part "app_state.dart";

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppInitial());

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    emit(const UserLogIn());
  }

  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
    // required BuildContext context,
  }) async {
    emit(const AuthLoading());

    // try create new user

    if (password == confirmPassword) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    }
    emit(const UserRegister());

    // Navigator.pop(context);
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Set favList = {};

  void addToFav(int index) {
    favList.add(index);
    debugPrint('$favList');
  }
}
