import 'package:tugas_kelompok/domain/entities/user_entity.dart';
import 'package:tugas_kelompok/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserEntity> getLoginData(String email) {
    // TODO: implement getLoginData
    throw UnimplementedError();
  }

  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(UserEntity loginData) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
