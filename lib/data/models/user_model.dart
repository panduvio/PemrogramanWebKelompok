import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tugas_kelompok/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
class UserModel extends UserEntity with _$UserModel {
  factory UserModel({
    required String name,
    required String email,
    required String password,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
