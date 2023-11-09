import 'dart:typed_data';

import 'package:tugas_kelompok/domain/repositories/todo_repository.dart';

class PostGetJobUsecase {
  final TodoRepository repository;

  PostGetJobUsecase(this.repository);

  Future<String> postGetJob(Uint8List file) {
    return repository.postGetJob(file);
  }
}
