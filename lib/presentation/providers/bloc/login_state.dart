part of 'login_bloc.dart';

abstract class LoginState {}

class LoginTryState extends LoginState {}

class LoginSuccessState extends LoginState {
  UserEntity loginData;

  LoginSuccessState({required this.loginData});
}

class SignUpTryState extends LoginState {}

class LoginFailedState extends LoginState {
  final String errorMessage;

  LoginFailedState(this.errorMessage);
}
