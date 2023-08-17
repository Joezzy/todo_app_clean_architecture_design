import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/core/errors/failure.dart';
import 'package:todo_clean_architecture/feature/todo/data/database/todo_remote_databse.dart';
import 'package:todo_clean_architecture/feature/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/feature/todo/domain/reprositries/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository{
  final TodoRemoteDatabase remoteDatabase;
  TodoRepositoryImpl({required this.remoteDatabase});

  @override
  Future<Either<Failure, Todo>> add(Todo todo)async {
    try{
      final result = await remoteDatabase.addTodo(todo);
      return Right(todo);
    }catch(e){
      return Left(Failure("Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, Todo>> delete(Todo todo)async {
    try{
      final result = await remoteDatabase.deleteTodo(todo);
      return Right(todo);
    }catch(e){
      return Left(Failure("Something went wrong"));
    }
  }


  @override
  Future<Either<Failure, Todo>> edit(Todo todo) async{
    try{
      final result = await remoteDatabase.editTodo(todo);
      return Right(todo);
    }catch(e){
      return Left(Failure("Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> getAll() async{
    try{
      final result = await remoteDatabase.listTodos();
      return Right(result);
    }catch(e){
      return Left(Failure("Something went wrong"));
    }
  }


  
}