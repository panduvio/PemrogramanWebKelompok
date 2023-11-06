import 'package:tugas_kelompok/domain/repositories/user_repository.dart';

class LoginUsecase {
  final UserRepository repository;

  LoginUsecase(this.repository);

  Future<void> login(String email, String password) {
    return repository.login(email, password);
  }
}
