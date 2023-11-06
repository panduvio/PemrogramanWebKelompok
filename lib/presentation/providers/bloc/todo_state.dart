part of 'todo_bloc.dart';

abstract class TodoState {}

class TodoLoadingState extends TodoState {}

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
