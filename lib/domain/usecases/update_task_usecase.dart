import 'package:tugas_kelompok/domain/entities/todo_entity.dart';
import 'package:tugas_kelompok/domain/repositories/todo_repository.dart';

class UpdateTaskUsecase {
  final TodoRepository repository;

  UpdateTaskUsecase(this.repository);

  Future<void> updateTask(TodoEntity task) {
    return repository.updateTask(task);
  }
}
