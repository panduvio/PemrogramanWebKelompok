part of 'todo_bloc.dart';

abstract class TodoState {}

class TodoLoadingState extends TodoState {}

class PredictLoadingState extends TodoState {}

class PredictSuccessState extends TodoState {
  final String job;

  PredictSuccessState({required this.job});
}

class TodoLoadedState extends TodoState {
  final List<TodoEntity> tasks;

  TodoLoadedState({required this.tasks});
}

class TodoErrorState extends TodoState {
  final String errorMessage;

  TodoErrorState({
    this.errorMessage = 'Failed to Fetch Tasks',
  });
}
