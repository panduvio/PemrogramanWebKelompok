import 'package:get_it/get_it.dart';
import 'package:tugas_kelompok/data/repositories/todo_repository_impl.dart';
import 'package:tugas_kelompok/data/repositories/user_repository_impl.dart';
import 'package:tugas_kelompok/domain/repositories/todo_repository.dart';
import 'package:tugas_kelompok/domain/repositories/user_repository.dart';
import 'package:tugas_kelompok/domain/usecases/add_task_usecase.dart';
import 'package:tugas_kelompok/domain/usecases/delete_task_usecase.dart';
import 'package:tugas_kelompok/domain/usecases/get_all_task.dart';
import 'package:tugas_kelompok/domain/usecases/get_login_usecase.dart';
import 'package:tugas_kelompok/domain/usecases/login_usecase.dart';
import 'package:tugas_kelompok/domain/usecases/signup_usecase.dart';
import 'package:tugas_kelompok/domain/usecases/update_task_usecase.dart';

final sl = GetIt.instance;

void setUp() {
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl());

  sl.registerLazySingleton<GetLoginUsecase>(() => GetLoginUsecase(sl()));
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(sl()));
  sl.registerLazySingleton<SignupUsecase>(() => SignupUsecase(sl()));

  sl.registerLazySingleton<GetAllTaskUsecase>(() => GetAllTaskUsecase(sl()));
  sl.registerLazySingleton<AddTaskUsecase>(() => AddTaskUsecase(sl()));
  sl.registerLazySingleton<UpdateTaskUsecase>(() => UpdateTaskUsecase(sl()));
  sl.registerLazySingleton<DeleteTaskUsecase>(() => DeleteTaskUsecase(sl()));
}
