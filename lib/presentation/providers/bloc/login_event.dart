part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class GetLogin extends LoginEvent {
  final String email;

  GetLogin({required this.email});
}

class Login extends LoginEvent {
  final String email;
  final String password;

  Login({
    required this.email,
    required this.password,
  });
}

class Signup extends LoginEvent {
  final UserModel loginData;

  Signup({required this.loginData});
}
