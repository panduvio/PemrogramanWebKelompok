import 'package:tugas_kelompok/data/models/user_model.dart';
import 'package:tugas_kelompok/domain/entities/user_entity.dart';
import 'package:tugas_kelompok/domain/repositories/user_repository.dart';

class SignupUsecase {
  final UserRepository repository;

  SignupUsecase(this.repository);

  Future<void> signup(UserModel loginData) {
    return repository.signUp(loginData);
  }
}
