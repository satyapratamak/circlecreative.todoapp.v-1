import 'package:flutter/cupertino.dart';
import 'package:todoapp/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: "Walk the dog",
      description: "Walking with the dog in the afternoon",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Plan the birthday party",
      description: "Birthday party with '-Robert' '- Deborah'",
    ),
  ];
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo? todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toogleTodoStatus(Todo? todo) {
    todo!.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo? todo, String title, String description) {
    todo!.title = title;
    todo.description = description;

    notifyListeners();
  }
}
