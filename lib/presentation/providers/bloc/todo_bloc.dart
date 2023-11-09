import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_kelompok/dependency_injector.dart';
import 'package:tugas_kelompok/domain/entities/todo_entity.dart';
import 'package:tugas_kelompok/domain/usecases/add_task_usecase.dart';
import 'package:tugas_kelompok/domain/usecases/delete_task_usecase.dart';
import 'package:tugas_kelompok/domain/usecases/get_all_task.dart';
import 'package:tugas_kelompok/domain/usecases/post_get_job_usecase.dart';
import 'package:tugas_kelompok/domain/usecases/update_task_usecase.dart';

part 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> with ChangeNotifier {
  TodoBloc() : super(TodoLoadingState()) {
    on<GetAllTask>(_getAllTask);
    on<AddTask>(_addTask);
    on<UpdateTask>(_updateTask);
    on<DeleteTask>(_deleteTask);
    on<Predict>(_predict);
  }

  void _getAllTask(GetAllTask event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());
    try {
      final tasks = await sl<GetAllTaskUsecase>().getTask();
      emit(TodoLoadedState(tasks: tasks));
    } catch (e) {
      throw Exception('Failed to load tasks: $e');
    }
  }

  void _predict(Predict event, Emitter<TodoState> emit) async {
    emit(PredictLoadingState());

    try {
      final result = await sl<PostGetJobUsecase>().postGetJob(event.file);
      emit(PredictSuccessState(job: result));
    } catch (e) {
      Exception('Failed to predict: $e');
    }
  }

  void _addTask(AddTask event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());
    try {
      await sl<AddTaskUsecase>().addTask(event.task);
      add(GetAllTask());
    } catch (e) {
      throw Exception('Failed to add Task: $e');
    }
  }

  void _updateTask(UpdateTask event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());
    try {
      await sl<UpdateTaskUsecase>().updateTask(event.task);
      add(GetAllTask());
    } catch (e) {
      throw Exception('Failed to update Task: $e');
    }
  }

  void _deleteTask(DeleteTask event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());
    try {
      await sl<DeleteTaskUsecase>().deleteTask(event.task);
      add(GetAllTask());
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }
}
