import 'package:tugas_kelompok/domain/entities/user_entity.dart';
import 'package:tugas_kelompok/domain/repositories/user_repository.dart';

class GetLoginUsecase {
  final UserRepository repository;

  GetLoginUsecase(this.repository);

  Future<UserEntity> getLogin(String email) {
    return repository.getLoginData(email);
  }
}
