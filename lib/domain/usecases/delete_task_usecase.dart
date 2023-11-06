import 'package:tugas_kelompok/domain/entities/todo_entity.dart';
import 'package:tugas_kelompok/domain/repositories/todo_repository.dart';

class DeleteTaskUsecase {
  final TodoRepository repository;

  DeleteTaskUsecase(this.repository);

  Future<void> deleteTask(TodoEntity task) {
    return repository.deleteTask(task);
  }
}
