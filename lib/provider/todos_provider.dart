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
}
