
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_clean_architecture/feature/todo/domain/entities/todo.dart';

abstract class TodoRemoteDatabase{
  Future<Todo> addTodo(Todo todo);
  Future<Todo> editTodo(Todo todo);
  Future<Todo> deleteTodo(Todo todo);
  Stream<List<Todo>> listTodos();
}


class TodoRemoteDatabaseImpl implements TodoRemoteDatabase{
  @override
  Future<Todo> addTodo(Todo todo) async{
   await FirebaseFirestore.instance
       .collection("todos")
        .doc(todo.id)
        .set(todo.toJson());
   return todo;
  }

  @override
  Future<Todo> deleteTodo(Todo todo) async{
    await FirebaseFirestore.instance
        .collection("todos")
    .doc(todo.id)
    .delete();
    return todo;
  }

  @override
  Future<Todo> editTodo(Todo todo) async{
    await FirebaseFirestore.instance
        .collection("todos")
        .doc(todo.id)
        .update(todo.toJson());
    return todo;
  }

  @override
  Stream<List<Todo>> listTodos() async* {
    // final todosData=
    yield* FirebaseFirestore.instance
        .collection("todos")
       .snapshots()
    .map((snapshot) {
      return snapshot.docs.map((e) => Todo.fromJson(e.data())).toList();
    });
  }
  
}