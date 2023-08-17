import 'package:get/get.dart';
import 'package:todo_clean_architecture/feature/todo/data/database/todo_remote_databse.dart';
import 'package:todo_clean_architecture/feature/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo_clean_architecture/feature/todo/domain/reprositries/todo_repository.dart';
import 'package:todo_clean_architecture/feature/todo/domain/usecases/add.dart';
import 'package:todo_clean_architecture/feature/todo/domain/usecases/delete.dart';
import 'package:todo_clean_architecture/feature/todo/domain/usecases/edit.dart';
import 'package:todo_clean_architecture/feature/todo/domain/usecases/getList.dart';
import 'package:todo_clean_architecture/feature/todo/presentation/controller/todo.controller.dart';

class TodoBinding extends Bindings {

  @override
  void dependencies(){
    Get.lazyPut<TodoRemoteDatabase>(() => TodoRemoteDatabaseImpl());
    Get.lazyPut<TodoRepository>(() => TodoRepositoryImpl(remoteDatabase:Get.find()));
    Get.lazyPut(() => AddTodoUseCase( Get.find()));
    Get.lazyPut(() => GetTodoUseCase( Get.find()));
    Get.lazyPut(() => EditTodoUseCase( Get.find()));
    Get.lazyPut(() => DeleteTodoUseCase( Get.find()));
    Get.lazyPut(() => TodoController(
        addTodoUseCase: Get.find(),
        getTodoUseCase: Get.find(),
        editTodoUseCase: Get.find(),
        deleteTodoUseCase: Get.find(),
    ));
  }
}

