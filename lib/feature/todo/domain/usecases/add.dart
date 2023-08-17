import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/core/errors/failure.dart';
import 'package:todo_clean_architecture/core/utils/usecase.dart';
import 'package:todo_clean_architecture/feature/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/feature/todo/domain/reprositries/todo_repository.dart';

class AddTodoUseCase implements UseCase<Todo, Todo>{
  final  TodoRepository repository;
  AddTodoUseCase(this.repository);

  @override
  Future<Either<Failure,Todo>> call(Todo todo)async{
   return await repository.add(todo);
  }
}