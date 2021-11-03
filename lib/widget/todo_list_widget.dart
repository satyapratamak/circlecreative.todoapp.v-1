import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/widget/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodoWidget(
      todo: Todo(
        createdTime: DateTime.now(),
        title: 'Walk with the dog',
      ),
    );
  }
}
