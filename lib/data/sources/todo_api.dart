import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:tugas_kelompok/data/models/todo_model.dart';
import 'package:tugas_kelompok/domain/entities/todo_entity.dart';

class TodoApi {
  final String baseUrl = 'http://127.0.0.1:8000/api/first/';
  final dio = Dio();

  Future<List<TodoEntity>> getAllTask() async {
    try {
      final response = await dio.get('$baseUrl/todolists');
      if (response.statusCode == 200) {
        final List<dynamic> taskList = response.data;
        final tasks = taskList.map((taskJson) {
          final todoModel = TodoModel.fromJson(taskJson);
          return TodoEntity(
              title: todoModel.title,
              description: todoModel.description,
              progress: todoModel.progress);
        }).toList();
        return tasks;
      } else {
        throw Exception('Failed to get data');
      }
    } catch (e) {
      throw Exception('Failed to get data: $e');
    }
  }

  Future<void> addTask(TodoEntity task) async {
    try {
      final response =
          await dio.post('$baseUrl/todolists', data: jsonEncode(task));
      if (response.statusCode != 200) {
        throw Exception('Failed to add task');
      }
    } catch (e) {
      throw Exception('Failed to add task: $e');
    }
  }

  Future<void> updateTask(TodoEntity task) async {
    try {
      final response =
          await dio.post('$baseUrl/todolists', data: jsonEncode(task));
      if (response.statusCode != 200) {
        throw Exception('Failed to update task');
      }
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  Future<void> deleteTask(TodoEntity task) async {
    try {
      final response =
          await dio.post('$baseUrl/todolists', data: jsonEncode(task));
      if (response.statusCode != 200) {
        throw Exception('Failed to delete task');
      }
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  Future<String> postGetJob(Uint8List file) async {
    try {
      final response =
          await dio.post('$baseUrl/jobpredict', data: jsonEncode(file));
      if (response.statusCode == 200) {
        return response.data;
      }
      return 'Predict failed';
    } catch (e) {
      throw Exception('Failed to predict: $e');
    }
  }
}
