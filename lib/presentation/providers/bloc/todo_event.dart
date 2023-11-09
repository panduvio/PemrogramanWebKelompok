part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class GetAllTask extends TodoEvent {}

class Predict extends TodoEvent {
  final Uint8List file;

  Predict({required this.file});
}

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
