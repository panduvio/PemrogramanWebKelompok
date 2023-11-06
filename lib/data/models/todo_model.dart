import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tugas_kelompok/domain/entities/todo_entity.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@Freezed()
class TodoModel extends TodoEntity with _$TodoModel {
  factory TodoModel({
    required String title,
    required String description,
    @Default(false) bool progress,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}
