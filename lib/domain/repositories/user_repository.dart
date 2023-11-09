import 'package:tugas_kelompok/data/models/user_model.dart';
import 'package:tugas_kelompok/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserModel> getLoginData(String email);
  Future<void> signUp(UserModel loginData);
  Future<void> login(String email, String password);
}
