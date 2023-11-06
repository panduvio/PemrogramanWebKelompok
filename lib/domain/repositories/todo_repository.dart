import 'package:tugas_kelompok/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getAllTask();
  Future<void> addTask(TodoEntity task);
  Future<void> deleteTask(TodoEntity task);
  Future<void> updateTask(TodoEntity task);
}
