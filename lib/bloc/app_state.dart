part of "app_cubit.dart";

abstract class AppState extends Equatable {
  const AppState();
}

class AppInitial extends AppState {
  const AppInitial();

  @override
  List<Object> get props => [];
}

class AuthLoading extends AppState {
  const AuthLoading();

  @override
  List<Object> get props => [];
}

class UserRegister extends AppState {
  const UserRegister();

  @override
  List<Object> get props => [];
}

class UserLogIn extends AppState {
  const UserLogIn();

  @override
  List<Object> get props => [];
}
