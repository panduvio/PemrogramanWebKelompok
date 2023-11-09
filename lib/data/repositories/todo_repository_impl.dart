import 'dart:typed_data';

import 'package:tugas_kelompok/data/sources/todo_api.dart';
import 'package:tugas_kelompok/domain/entities/todo_entity.dart';
import 'package:tugas_kelompok/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final _todoApi = TodoApi();
  @override
  Future<void> addTask(TodoEntity task) async {
    _todoApi.addTask(task);
  }

  @override
  Future<void> deleteTask(TodoEntity task) async {
    _todoApi.deleteTask(task);
  }

  @override
  Future<List<TodoEntity>> getAllTask() async {
    final List<TodoEntity> tasks = await _todoApi.getAllTask();
    return tasks;
  }

  @override
  Future<void> updateTask(TodoEntity task) async {
    _todoApi.updateTask(task);
  }

  @override
  Future<String> postGetJob(Uint8List file) async {
    final job = _todoApi.postGetJob(file);
    return job;
  }
}
