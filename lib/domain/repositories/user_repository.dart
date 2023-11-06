import 'package:tugas_kelompok/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getLoginData(String email);
  Future<void> signUp(UserEntity loginData);
  Future<void> login(String email, String password);
}
