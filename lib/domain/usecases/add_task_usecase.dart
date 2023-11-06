import 'package:tugas_kelompok/domain/entities/todo_entity.dart';
import 'package:tugas_kelompok/domain/repositories/todo_repository.dart';

class AddTaskUsecase {
  final TodoRepository repository;

  AddTaskUsecase(this.repository);

  Future<void> addTask(TodoEntity task) {
    return repository.addTask(task);
  }
}
