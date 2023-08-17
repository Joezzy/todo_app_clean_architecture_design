import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_clean_architecture/core/utils/usecase.dart';
import 'package:todo_clean_architecture/feature/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/feature/todo/domain/usecases/add.dart';
import 'package:todo_clean_architecture/feature/todo/domain/usecases/delete.dart';
import 'package:todo_clean_architecture/feature/todo/domain/usecases/edit.dart';
import 'package:todo_clean_architecture/feature/todo/domain/usecases/getList.dart';

class TodoController extends GetxController{
  final AddTodoUseCase addTodoUseCase;
  final GetTodoUseCase  getTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;
  final EditTodoUseCase editTodoUseCase;

  TodoController({
    required this.addTodoUseCase,
    required this.getTodoUseCase,
    required this.deleteTodoUseCase,
    required this.editTodoUseCase
  });

  final formKey=GlobalKey<FormState>();
  final titleController= TextEditingController();
  final descriptionController= TextEditingController();

void clearText(){
  titleController.clear();
  descriptionController.clear();
}


  Future<void> addTodo()async{
    final result=await addTodoUseCase(
        Params(Todo(id: generateId(10),text: titleController.text.trim(), description: descriptionController.text.trim()))
    );
    
    result.fold((failure) {
      Get.snackbar("Failed", failure.message);
    }, (todo) {
      clearText();
      Get.snackbar("Succeessful","${todo.text} added!");
    });

  }


  Stream<List<Todo>> getTodo() async* {
    final result=await getTodoUseCase(NoParams());
    yield* result.fold((failure) {
      Get.snackbar("Failed", failure.message);
      return Stream.value([]);
    }, (todoList) {
      return todoList;
    });

  }



  String generateId(int length) {
    const  alphanumericChars = '0123456789abcdefghijklmnopqrstuvwxyz';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => alphanumericChars.codeUnitAt(random.nextInt(alphanumericChars.length))));
  }


}