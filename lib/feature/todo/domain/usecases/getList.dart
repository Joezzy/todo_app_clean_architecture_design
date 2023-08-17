import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/core/errors/failure.dart';
import 'package:todo_clean_architecture/core/utils/usecase.dart';
import 'package:todo_clean_architecture/feature/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/feature/todo/domain/reprositries/todo_repository.dart';

class GetTodoUseCase implements UseCase<List<Todo>, NoParams>{
  final  TodoRepository repository;
  GetTodoUseCase(this.repository);

  @override
  Future<Either<Failure,List<Todo>>> call(NoParams params)async{
    return await repository.getAll();
  }
}