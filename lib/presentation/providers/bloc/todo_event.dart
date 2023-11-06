part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class GetAllTask extends TodoEvent {}

class AddTask extends TodoEvent {
  final TodoEntity task;

  AddTask({required this.task});
}

class UpdateTask extends TodoEvent {
  final TodoEntity task;

  UpdateTask({required this.task});
}

class DeleteTask extends TodoEvent {
  final TodoEntity task;

  DeleteTask({required this.task});
}
