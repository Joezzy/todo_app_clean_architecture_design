import 'package:todo_clean_architecture/feature/todo/domain/entities/todo.dart';

abstract class TodoRepository{
   Future<Todo> add(Todo todo);
   Future<Todo> edit(Todo todo);
   Future<Todo> delete(Todo todo);
   Future<List<Todo>> getAll(Todo todo);
}