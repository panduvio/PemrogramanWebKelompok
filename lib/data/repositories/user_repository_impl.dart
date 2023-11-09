import 'package:tugas_kelompok/data/models/user_model.dart';
import 'package:tugas_kelompok/data/sources/login_api.dart';
import 'package:tugas_kelompok/domain/entities/user_entity.dart';
import 'package:tugas_kelompok/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final _loginApi = LoginApi();
  @override
  Future<UserModel> getLoginData(String email) async {
    final user = await _loginApi.getLogin(email);
    return user;
  }

  @override
  Future<void> login(String email, String password) async {
    _loginApi.login(email, password);
  }

  @override
  Future<void> signUp(UserModel loginData) async {
    _loginApi.signup(loginData);
  }
}
