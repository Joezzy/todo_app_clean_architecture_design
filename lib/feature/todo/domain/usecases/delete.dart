import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/core/errors/failure.dart';
import 'package:todo_clean_architecture/core/utils/usecase.dart';
import 'package:todo_clean_architecture/feature/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/feature/todo/domain/reprositries/todo_repository.dart';

class DeleteTodoUseCase implements UseCase<Todo, Params<Todo>>{
  final  TodoRepository repository;
  DeleteTodoUseCase(this.repository);

  @override
  Future<Either<Failure,Todo>> call(Params todo)async{
    return await repository.delete(todo.data);
  }
}