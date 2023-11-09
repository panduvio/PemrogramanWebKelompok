import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_kelompok/data/models/user_model.dart';
import 'package:tugas_kelompok/dependency_injector.dart';
import 'package:tugas_kelompok/domain/entities/user_entity.dart';
import 'package:tugas_kelompok/domain/usecases/get_login_usecase.dart';
import 'package:tugas_kelompok/domain/usecases/login_usecase.dart';
import 'package:tugas_kelompok/domain/usecases/signup_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with ChangeNotifier {
  LoginBloc() : super(LoginTryState()) {
    on<GetLogin>(_getLogin);
    on<Signup>(_signup);
    on<Login>(_login);
  }

  void _getLogin(GetLogin event, Emitter<LoginState> emit) async {
    emit(LoginTryState());
    try {
      final login = await sl<GetLoginUsecase>().getLogin(event.email);
      emit(LoginSuccessState(loginData: login));
    } catch (e) {
      throw Exception('Failed to get data: $e');
    }
    notifyListeners();
  }

  void _signup(Signup event, Emitter<LoginState> emit) async {
    emit(SignUpTryState());
    try {
      await sl<SignupUsecase>().signup(event.loginData);
      emit(LoginTryState());
    } catch (e) {
      print('Failed to sign up: $e');
    }
    notifyListeners();
  }

  void _login(Login event, Emitter<LoginState> emit) async {
    emit(LoginTryState());
    try {
      await sl<LoginUsecase>().login(event.email, event.password);
      add(GetLogin(email: event.email));
    } catch (e) {
      print('Failed to Login: $e');
    }
  }
}
