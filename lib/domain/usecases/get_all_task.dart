import 'package:tugas_kelompok/domain/entities/todo_entity.dart';
import 'package:tugas_kelompok/domain/repositories/todo_repository.dart';

class GetAllTaskUsecase {
  final TodoRepository repository;

  GetAllTaskUsecase(this.repository);

  Future<List<TodoEntity>> getTask() {
    return repository.getAllTask();
  }
}
